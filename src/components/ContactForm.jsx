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
      <div className="absolute top-0 right-0 w-[500px] h-[500px] bg-[#B721FF]/10 rounded-full blur-[120px]" />
      <div className="container mx-auto px-6 flex flex-col lg:flex-row gap-16">
        <div className="lg:w-1/2">
          <h2 className="text-4xl font-bold mb-6">Iniziamo il Tuo Viaggio</h2>
          <p className="text-gray-400 mb-12">Hai un progetto audace? Siamo qui per realizzarlo.</p>
          <div className="space-y-6">
             <div className="flex items-center gap-4"><div className="w-12 h-12 rounded-full bg-white/5 flex items-center justify-center"><Mail className="text-[#00D9FF]" /></div><div><div className="text-xs text-gray-500 uppercase">Email</div><div>{EMAIL_DESTINAZIONE}</div></div></div>
             <div className="flex items-center gap-4"><div className="w-12 h-12 rounded-full bg-white/5 flex items-center justify-center"><Phone className="text-[#B721FF]" /></div><div><div className="text-xs text-gray-500 uppercase">Telefono</div><div>+39 328 173 6685</div></div></div>
          </div>
        </div>
        <div className="lg:w-1/2 relative">
          <form onSubmit={handleSubmit} className="p-8 rounded-3xl bg-white/5 backdrop-blur-xl border border-white/10 relative">
            {status === 'success' && <div className="absolute inset-0 z-20 bg-[#050505]/95 flex flex-col items-center justify-center text-center animate-slide-up"><CheckCircle className="w-16 h-16 text-green-500 mb-4" /><h3 className="text-2xl font-bold">Inviato!</h3><button onClick={() => setStatus('idle')} className="mt-4 text-[#00D9FF] underline">Nuovo</button></div>}
            <div className="space-y-6">
               <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                 <input type="text" value={formData.name} onChange={e => setFormData({...formData, name: e.target.value})} className={`w-full bg-black/40 border ${errors.name ? 'border-red-500' : 'border-white/10'} rounded-lg px-4 py-3 text-white`} placeholder="Nome *" />
                 <input type="tel" value={formData.phone} onChange={e => setFormData({...formData, phone: e.target.value})} className="w-full bg-black/40 border border-white/10 rounded-lg px-4 py-3 text-white" placeholder="Telefono" />
               </div>
               <input type="email" value={formData.email} onChange={e => setFormData({...formData, email: e.target.value})} className={`w-full bg-black/40 border ${errors.email ? 'border-red-500' : 'border-white/10'} rounded-lg px-4 py-3 text-white`} placeholder="Email *" />
               <textarea rows="4" value={formData.message} onChange={e => setFormData({...formData, message: e.target.value})} className={`w-full bg-black/40 border ${errors.message ? 'border-red-500' : 'border-white/10'} rounded-lg px-4 py-3 text-white`} placeholder="Messaggio *" />
               <div className="space-y-3 text-xs text-gray-400">
                 <label className="flex gap-3 cursor-pointer"><input type="checkbox" checked={formData.privacy} onChange={e => setFormData({...formData, privacy: e.target.checked})} /><span>Accetto la <Link to="/privacy" className="text-[#00D9FF] hover:underline">Privacy Policy</Link>.</span></label>
                 {errors.privacy && <span className="text-red-500 block">Obbligatorio</span>}
                 <label className="flex gap-3 cursor-pointer"><input type="checkbox" checked={formData.terms} onChange={e => setFormData({...formData, terms: e.target.checked})} /><span>Accetto i <Link to="/terms" className="text-[#00D9FF] hover:underline">Termini</Link>.</span></label>
                 {errors.terms && <span className="text-red-500 block">Obbligatorio</span>}
               </div>
               <button type="submit" disabled={status === 'loading'} className="w-full bg-[#00D9FF] text-black font-bold py-4 rounded-lg flex justify-center gap-2 disabled:opacity-50">{status === 'loading' ? <Loader2 className="animate-spin" /> : <>Invia <Send className="w-4 h-4" /></>}</button>
               {serverError && <div className="text-red-500 text-center text-sm mt-2">{serverError}</div>}
            </div>
          </form>
        </div>
      </div>
    </section>
  );
};
export default ContactForm;
