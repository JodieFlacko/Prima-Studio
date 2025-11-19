import React, { useState, useEffect } from 'react';
import { Cookie, X, Lock } from 'lucide-react';

const CookieBanner = ({ openPreferences, setOpenPreferences }) => {
  const [visible, setVisible] = useState(false);
  const [showDetails, setShowDetails] = useState(false);
  const [preferences, setPreferences] = useState({ essential: true, analytics: false, marketing: false });

  useEffect(() => { if (!localStorage.getItem('cookie-consent')) setTimeout(() => setVisible(true), 1000); }, []);
  useEffect(() => { if (openPreferences) { setVisible(true); setShowDetails(true); } }, [openPreferences]);

  const close = () => { setVisible(false); setShowDetails(false); if (setOpenPreferences) setOpenPreferences(false); };
  const save = () => { localStorage.setItem('cookie-consent', 'true'); close(); };

  if (!visible) return null;

  return (
    <div className="fixed bottom-0 left-0 w-full z-[100] p-4 flex justify-center" role="dialog" aria-labelledby="cookie-heading" aria-modal="true">
      <div className="w-full max-w-5xl bg-[#0a0a0a]/95 backdrop-blur-xl border border-white/10 rounded-2xl p-6 shadow-2xl animate-slide-up">
        {!showDetails ? (
          <div className="flex flex-col md:flex-row justify-between gap-6 items-center">
            <div className="flex-1 flex items-center gap-3"><Cookie className="text-[#B721FF] w-8 h-8" aria-hidden="true" /><div><h3 id="cookie-heading" className="font-bold text-white text-lg">Privacy & Cookie</h3><p className="text-sm text-gray-300 mt-1">Utilizziamo cookie per migliorare l'esperienza. Rispetta la tua privacy.</p></div></div>
            <div className="flex gap-3"><button onClick={save} className="px-4 py-2 border border-white/20 rounded-lg text-white hover:bg-white/10 text-sm font-medium transition-colors">Rifiuta</button><button onClick={() => setShowDetails(true)} className="px-4 py-2 border border-white/20 rounded-lg text-white hover:bg-white/10 text-sm font-medium transition-colors">Personalizza</button><button onClick={save} className="px-4 py-2 bg-[#00D9FF] hover:bg-[#00b8d9] text-black font-bold rounded-lg text-sm transition-colors">Accetta</button></div>
          </div>
        ) : (
          <div className="space-y-4">
             <div className="flex justify-between items-center border-b border-white/10 pb-2"><h3 className="font-bold text-white text-lg">Preferenze Cookie</h3><button onClick={close} className="text-white hover:text-[#00D9FF] p-1 rounded" aria-label="Chiudi pannello preferenze"><X aria-hidden="true" /></button></div>
             <div className="space-y-2 text-white">
               <div className="flex justify-between items-center p-3 bg-white/5 rounded"><span className="font-bold">Necessari</span><Lock className="w-4 h-4 text-[#00D9FF]" aria-hidden="true"/></div>
               <div className="flex justify-between items-center p-3 bg-white/5 rounded"><label htmlFor="analytics-toggle" className="font-bold cursor-pointer">Analitici</label><button id="analytics-toggle" role="switch" aria-checked={preferences.analytics} onClick={() => setPreferences({...preferences, analytics: !preferences.analytics})} className={`w-10 h-5 rounded-full relative transition-colors ${preferences.analytics ? 'bg-[#00D9FF]' : 'bg-gray-700'}`} aria-label="Attiva cookie analitici"><div className={`absolute top-1 w-3 h-3 bg-white rounded-full transition-all ${preferences.analytics ? 'right-1' : 'left-1'}`} /></button></div>
             </div>
             <button onClick={save} className="w-full py-3 bg-white hover:bg-gray-200 text-black font-bold rounded-lg mt-4">Salva Preferenze</button>
          </div>
        )}
      </div>
    </div>
  );
};
export default CookieBanner;
