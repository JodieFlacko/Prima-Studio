import React, { useState, useEffect } from 'react';
import { Cookie, X, Lock } from 'lucide-react';

const CookieBanner = ({ openPreferences, setOpenPreferences }) => {
  const [visible, setVisible] = useState(false);
  const [showDetails, setShowDetails] = useState(false);

  useEffect(() => { if (!localStorage.getItem('cookie-consent')) setTimeout(() => setVisible(true), 1000); }, []);
  useEffect(() => { if (openPreferences) { setVisible(true); setShowDetails(true); } }, [openPreferences]);

  const close = () => { setVisible(false); setShowDetails(false); if (setOpenPreferences) setOpenPreferences(false); };
  const save = () => { localStorage.setItem('cookie-consent', 'true'); close(); };

  if (!visible) return null;

  return (
    <div className="fixed bottom-0 left-0 w-full z-[100] p-4 flex justify-center">
      <div className="w-full max-w-5xl bg-[#0a0a0a]/95 backdrop-blur-xl border border-white/10 rounded-2xl p-6 shadow-2xl animate-slide-up">
        {!showDetails ? (
          <div className="flex flex-col md:flex-row justify-between gap-6 items-center">
            <div className="flex-1 flex items-center gap-3"><Cookie className="text-[#B721FF]" /><p className="text-sm text-gray-400">Utilizziamo cookie per migliorare l'esperienza.</p></div>
            <div className="flex gap-3"><button onClick={save} className="px-4 py-2 border border-white/20 rounded-lg text-white text-sm">Rifiuta</button><button onClick={() => setShowDetails(true)} className="px-4 py-2 border border-white/20 rounded-lg text-white text-sm">Personalizza</button><button onClick={save} className="px-4 py-2 bg-[#00D9FF] font-bold rounded-lg text-sm">Accetta</button></div>
          </div>
        ) : (
          <div className="space-y-4">
             <div className="flex justify-between items-center border-b border-white/10 pb-2"><h3 className="font-bold text-white">Preferenze</h3><button onClick={close} className="text-white"><X /></button></div>
             <div className="space-y-2 text-white"><div className="flex justify-between p-3 bg-white/5 rounded"><span>Necessari</span><Lock className="w-4 h-4 text-[#00D9FF]"/></div><div className="flex justify-between p-3 bg-white/5 rounded"><span>Analitici</span><div className="w-10 h-5 bg-gray-700 rounded-full relative"><div className="absolute left-1 top-1 w-3 h-3 bg-white rounded-full"/></div></div></div>
             <button onClick={save} className="w-full py-3 bg-white text-black font-bold rounded-lg mt-4">Salva</button>
          </div>
        )}
      </div>
    </div>
  );
};
export default CookieBanner;
