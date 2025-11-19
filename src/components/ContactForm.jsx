import React, { useState } from 'react';
import { Mail, Phone, CheckCircle, Send, Loader2 } from 'lucide-react';
import { Link } from 'react-router-dom';
import { EMAIL_DESTINAZIONE } from '../data/constants';

const ContactForm = () => {
  const [formData, setFormData] = useState({ name: '', email: '', phone: '', message: '', privacy: false, terms: false });
  const [status, setStatus] = useState('idle');
  const [errors, setErrors] = useState({});
  const [serverError, setServerError] = useState(null);

  const validate = () => {
    const newErrors = {};
    if (!formData.name) newErrors.name = "Obbligatorio";
    if (!formData.email || !/^\S+@\S+\.\S+$/.test(formData.email)) newErrors.email = "Email non valida";
    if (!formData.message) newErrors.message = "Obbligatorio";
    if (!formData.privacy) newErrors.privacy = "Richiesto";
    if (!formData.terms) newErrors.terms = "Richiesto";
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validate()) return;
    setStatus('loading'); setServerError(null);
    try {
      const res = await fetch('/api/send', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(formData) });
      const data = await res.json();
      if (res.ok) { setStatus('success'); setFormData({ name: '', email: '', phone: '', message: '', privacy: false, terms: false }); }
      else { setServerError(data.error || "Errore nell'invio."); setStatus('error'); }
    } catch (error) { setServerError("Errore di connessione."); setStatus('error'); }
  };

  return (
    <section id="contact" className="py-24 bg-[#020202] relative overflow-hidden">
      <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-[#B721FF]/10 rounded-full blur-[120px] pointer-events-none" />
      <div className="container mx-auto px-6 flex flex-col lg:flex-row gap-16">
        <div className="lg:w-1/2">
          <h2 className="text-4xl md:text-5xl font-bold mb-6 text-white">Iniziamo il Tuo Viaggio</h2>
          <p className="text-gray-300 text-lg mb-12">Hai un progetto audace in mente? Siamo qui per realizzarlo. Contattaci per una consulenza gratuita.</p>
          <div className="space-y-6">
             <div className="flex items-center gap-4"><div className="w-12 h-12 rounded-full bg-white/5 flex items-center justify-center text-[#00D9FF]"><Mail className="w-6 h-6" aria-hidden="true" /></div><div><div className="text-xs text-gray-400 uppercase tracking-wider">Email</div><a href={`mailto:${EMAIL_DESTINAZIONE}`} className="text-xl font-medium text-white hover:text-[#00D9FF] hover:underline">{EMAIL_DESTINAZIONE}</a></div></div>
             <div className="flex items-center gap-4"><div className="w-12 h-12 rounded-full bg-white/5 flex items-center justify-center text-[#B721FF]"><Phone className="w-6 h-6" aria-hidden="true" /></div><div><div className="text-xs text-gray-400 uppercase tracking-wider">Telefono</div><a href="tel:+393281736685" className="text-xl font-medium text-white hover:text-[#B721FF] hover:underline">+39 328 173 6685</a></div></div>
          </div>
        </div>
        <div className="lg:w-1/2 relative">
          <form onSubmit={handleSubmit} className="p-8 rounded-3xl bg-white/5 backdrop-blur-xl border border-white/10 relative" aria-label="Modulo di contatto">
            {status === 'success' && <div className="absolute inset-0 z-20 bg-[#050505]/95 flex flex-col items-center justify-center text-center animate-slide-up rounded-3xl"><CheckCircle className="w-16 h-16 text-green-500 mb-4" /><h3 className="text-2xl font-bold text-white">Messaggio Inviato!</h3><button type="button" onClick={() => setStatus('idle')} className="mt-4 text-[#00D9FF] underline hover:text-white">Invia un altro messaggio</button></div>}
            <div className="space-y-6">
               <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                 <div><label htmlFor="name" className="sr-only">Nome</label><input id="name" type="text" aria-label="Nome" value={formData.name} onChange={e => setFormData({...formData, name: e.target.value})} className={`w-full bg-black/40 border ${errors.name ? 'border-red-500' : 'border-white/10'} rounded-lg px-4 py-3 text-white placeholder-gray-500 focus:border-[#00D9FF] focus:outline-none transition-all`} placeholder="Nome *" /></div>
                 <div><label htmlFor="phone" className="sr-only">Telefono</label><input id="phone" type="tel" aria-label="Telefono" value={formData.phone} onChange={e => setFormData({...formData, phone: e.target.value})} className="w-full bg-black/40 border border-white/10 rounded-lg px-4 py-3 text-white placeholder-gray-500 focus:border-[#00D9FF] focus:outline-none transition-all" placeholder="Telefono" /></div>
               </div>
               <div><label htmlFor="email" className="sr-only">Email</label><input id="email" type="email" aria-label="Email" value={formData.email} onChange={e => setFormData({...formData, email: e.target.value})} className={`w-full bg-black/40 border ${errors.email ? 'border-red-500' : 'border-white/10'} rounded-lg px-4 py-3 text-white placeholder-gray-500 focus:border-[#00D9FF] focus:outline-none transition-all`} placeholder="Email *" /></div>
               <div><label htmlFor="message" className="sr-only">Messaggio</label><textarea id="message" rows="4" aria-label="Messaggio" value={formData.message} onChange={e => setFormData({...formData, message: e.target.value})} className={`w-full bg-black/40 border ${errors.message ? 'border-red-500' : 'border-white/10'} rounded-lg px-4 py-3 text-white placeholder-gray-500 focus:border-[#00D9FF] focus:outline-none transition-all`} placeholder="Messaggio *" /></div>
               <div className="space-y-3 text-xs text-gray-300">
                 <label className="flex items-start gap-3 cursor-pointer group"><input type="checkbox" checked={formData.privacy} onChange={e => setFormData({...formData, privacy: e.target.checked})} className="mt-1 bg-transparent border-white/30 rounded checked:bg-[#00D9FF]" /><span>Accetto la <Link to="/privacy" className="text-[#00D9FF] underline hover:text-white">Privacy Policy</Link>.</span></label>
                 {errors.privacy && <span className="text-red-500 block font-bold" role="alert">Devi accettare la privacy policy.</span>}
                 <label className="flex items-start gap-3 cursor-pointer group"><input type="checkbox" checked={formData.terms} onChange={e => setFormData({...formData, terms: e.target.checked})} className="mt-1 bg-transparent border-white/30 rounded checked:bg-[#00D9FF]" /><span>Accetto i <Link to="/terms" className="text-[#00D9FF] underline hover:text-white">Termini e Condizioni</Link>.</span></label>
                 {errors.terms && <span className="text-red-500 block font-bold" role="alert">Devi accettare i termini.</span>}
               </div>
               <button type="submit" disabled={status === 'loading'} className="w-full bg-[#00D9FF] hover:bg-[#00b8d9] text-black font-bold py-4 rounded-lg flex justify-center items-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed transition-colors">{status === 'loading' ? <Loader2 className="animate-spin" /> : <>Invia Richiesta <Send className="w-4 h-4" aria-hidden="true" /></>}</button>
               {serverError && <div className="text-red-500 text-center text-sm mt-2 font-medium" role="alert">{serverError}</div>}
            </div>
          </form>
        </div>
      </div>
    </section>
  );
};
export default ContactForm;
