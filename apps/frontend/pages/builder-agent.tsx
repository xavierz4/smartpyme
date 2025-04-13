import { useState } from "react";
import { SendHorizonal, Loader2 } from "lucide-react";

export default function BuilderAgent() {
  const [prompt, setPrompt] = useState("");
  const [response, setResponse] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e?: React.FormEvent) => {
    if (e) {
      e.preventDefault();
    }
    if (!prompt.trim()) return;
    setLoading(true);
    setResponse("");
    try {
      const res = await fetch("/api/llm-builder", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ prompt }),
      });

      if (!res.ok) {
        throw new Error(`HTTP error! status: ${res.status}`);
      }

      const data = await res.json();
      setResponse(data.result || "Sin respuesta.");
    } catch (err) {
      console.error("Error:", err);
      setResponse(`Error al procesar el prompt: ${err instanceof Error ? err.message : "Error desconocido"}`);
    }
    setLoading(false);
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLTextAreaElement>) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSubmit();
    }
  };

  return (
    <div className="min-h-screen bg-[#f5f5f5] text-gray-800 flex flex-col items-center px-4 py-40">
      <div className="w-full max-w-4xl bg-white rounded-xl shadow-md p-8">
        <h1 className="text-2xl font-semibold text-gray-900 mb-6 text-center">Agente Constructor IA</h1>

        <form onSubmit={handleSubmit} className="relative mb-4">
          <textarea
            className="w-full min-h-[120px] resize-none border border-gray-300 rounded-xl p-4 pr-12 focus:outline-none focus:ring-2 focus:ring-gray-400 bg-gray-50 text-sm"
            placeholder="Describe lo que quieres construir..."
            value={prompt}
            onChange={(e) => setPrompt(e.target.value)}
            onKeyDown={handleKeyDown}
          />
          <button
            type="submit"
            disabled={loading}
            className="absolute right-4 bottom-4 text-gray-500 hover:text-gray-800"
          >
            {loading ? <Loader2 className="animate-spin w-5 h-5" /> : <SendHorizonal className="w-5 h-5" />}
          </button>
        </form>

        <div className="border-t border-gray-200 pt-4">
          <div className="bg-gray-50 rounded-lg p-4 text-sm text-gray-700 whitespace-pre-wrap">
            {response}
          </div>
        </div>
      </div>
    </div>
  );
}
