#!/bin/bash

echo "🚀 Inizializzazione del progetto Prima Studio (Production Grade)..."

# 1. Pulizia e Creazione Struttura
# Rimuove le cartelle esistenti per evitare conflitti e crea la nuova struttura
rm -rf src api
mkdir -p src/components
mkdir -p src/pages
mkdir -p src/data
mkdir -p api

# 2. Configurazione Dipendenze (Package.json)
# Aggiorna le dipendenze includendo react-router-dom e react-helmet-async
cat > package.json << 'EOF'
{
  "name": "prima-studio",
  "private": true,
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "lint": "eslint . --ext js,jsx --report-unused-disable-directives --max-warnings 0",
    "preview": "vite preview"
  },
  "dependencies": {
    "lucide-react": "^0.460.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-router-dom": "^6.28.0",
    "react-helmet-async": "^2.0.4"
  },
  "devDependencies": {
    "@types/react": "^18.3.12",
    "@types/react-dom": "^18.3.1",
    "@vitejs/plugin-react": "^4.3.3",
    "autoprefixer": "^10.4.20",
    "eslint": "^9.15.0",
    "eslint-plugin-react": "^7.37.2",
    "eslint-plugin-react-hooks": "^5.0.0",
    "eslint-plugin-react-refresh": "^0.4.14",
    "postcss": "^8.4.49",
    "tailwindcss": "^3.4.15",
    "vite": "^6.0.0"
  }
}
EOF

# 3. Configurazione Build & Stili

# vite.config.js
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
})
EOF

# tailwind.config.js
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      animation: {
        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
    },
  },
  plugins: [],
}
EOF

# postcss.config.js
cat > postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# .gitignore
cat > .gitignore << 'EOF'
node_modules/
dist/
.env
.env.local
.DS_Store
EOF

# .env (Template)
cat > .env << 'EOF'
VITE_RESEND_API_KEY=re_123456_la_tua_chiave_qui
EOF

# index.html (SEO base e lingua italiana)
cat > index.html << 'EOF'
<!doctype html>
<html lang="it">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Prima Studio Agency</title>
    <meta name="description" content="Agenzia di Web Design Premium per brand visionari.">
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.jsx"></script>
  </body>
</html>
EOF

# src/index.css
cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@keyframes loading-bar { 0% { transform: scaleX(0); } 100% { transform: scaleX(1); } }
.animate-loading-bar { animation: loading-bar 1.5s cubic-bezier(0.4, 0, 0.2, 1) forwards; }
.animate-slide-up { animation: slideUp 0.5s ease-out forwards; }
@keyframes slideUp { from { transform: translateY(100%); opacity: 0; } to { transform: translateY(0); opacity: 1; } }

/* Nasconde la scrollbar ma permette lo scroll */
.no-scrollbar::-webkit-scrollbar {
  display: none;
}
.no-scrollbar {
  -ms-overflow-style: none;
  scrollbar-width: none;
}
EOF

# 4. Dati (Separation of Concerns)

cat > src/data/constants.js << 'EOF'
import { Palette, Code, Layers, Monitor } from 'lucide-react';

export const EMAIL_DESTINAZIONE = "info@prima-studio-agency.com";

export const SERVICES = [
  {
    id: 'ui-ux',
    icon: Palette,
    title: "UI/UX Design",
    desc: "Interfacce intuitive che guidano l'utente attraverso percorsi emozionali e funzionali."
  },
  {
    id: 'dev',
    icon: Code,
    title: "Sviluppo Web",
    desc: "Codice pulito, performante e scalabile utilizzando le tecnologie più avanzate."
  },
  {
    id: 'brand',
    icon: Layers,
    title: "Branding Identity",
    desc: "Costruiamo marchi memorabili che risuonano nel mercato globale."
  },
  {
    id: 'ecom',
    icon: Monitor,
    title: "E-Commerce",
    desc: "Soluzioni di vendita digitale ottimizzate per la conversione."
  }
];

export const PROJECTS = [
  {
    id: 1,
    title: "Neon Horizon",
    category: "Fintech",
    image: "https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=800&q=80",
    stats: "Conversion +150%",
    desc: "Un restyling completo per una banca digitale, focalizzato sulla Gen Z."
  },
  {
    id: 2,
    title: "Aether Luxury",
    category: "E-Commerce",
    image: "https://images.unsplash.com/photo-1600607686527-6fb886090705?auto=format&fit=crop&w=800&q=80",
    stats: "Awards: Awwwards SOTD",
    desc: "Piattaforma e-commerce minimalista per un brand di alta moda sostenibile."
  },
  {
    id: 3,
    title: "Quantum Leap",
    category: "SaaS Dashboard",
    image: "https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=800&q=80",
    stats: "Users: 50k+",
    desc: "Dashboard analitica complessa resa semplice attraverso una UX data-driven."
  },
  {
    id: 4,
    title: "Velvet Sound",
    category: "Entertainment",
    image: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&w=800&q=80",
    stats: "Engagement +80%",
    desc: "Esperienza immersiva per il lancio di una nuova etichetta discografica."
  }
];
EOF

# 5. Componenti (UI Blocks)

# CustomCursor
cat > src/components/CustomCursor.jsx << 'EOF'
import React, { useState, useEffect } from 'react';

const CustomCursor = () => {
  const [pos, setPos] = useState({ x: 0, y: 0 });
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    const move = (e) => { setPos({ x: e.clientX, y: e.clientY }); setVisible(true); };
    const leave = () => setVisible(false);
    window.addEventListener('mousemove', move);
    document.addEventListener('mouseleave', leave);
    return () => { window.removeEventListener('mousemove', move); document.removeEventListener('mouseleave', leave); };
  }, []);

  if (!visible) return null;
  return (
    <div className="fixed top-0 left-0 w-8 h-8 border border-[#00D9FF] rounded-full pointer-events-none z-[9999] -translate-x-1/2 -translate-y-1/2 hidden lg:block transition-opacity duration-300" style={{ left: pos.x, top: pos.y }}>
      <div className="absolute top-1/2 left-1/2 w-1 h-1 bg-white rounded-full -translate-x-1/2 -translate-y-1/2" />
    </div>
  );
};
export default CustomCursor;
EOF

# Navbar (Smart Navigation with Router)
cat > src/components/Navbar.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { Menu, X } from 'lucide-react';
import { Link, useLocation, useNavigate } from 'react-router-dom';

const Navbar = () => {
  const [scrolled, setScrolled] = useState(false);
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);
  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    const handleScroll = () => setScrolled(window.scrollY > 50);
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  const handleNav = (target) => {
    setMobileMenuOpen(false);
    if (target.startsWith('#')) {
      if (location.pathname === '/') {
        document.getElementById(target.substring(1))?.scrollIntoView({ behavior: 'smooth' });
      } else {
        navigate('/');
        setTimeout(() => document.getElementById(target.substring(1))?.scrollIntoView({ behavior: 'smooth' }), 100);
      }
    } else {
      navigate(target);
      window.scrollTo(0, 0);
    }
  };

  return (
    <nav className={`fixed w-full z-50 transition-all duration-500 ${scrolled ? 'bg-[#050505]/80 backdrop-blur-xl border-b border-white/5 py-4' : 'bg-transparent py-6'}`}>
      <div className="container mx-auto px-6 flex justify-between items-center">
        <Link to="/" className="text-2xl font-bold tracking-tighter" onClick={() => window.scrollTo(0,0)}>PRIMA<span className="text-[#00D9FF]">.</span>STUDIO</Link>
        <div className="hidden md:flex items-center gap-8">
          <button onClick={() => handleNav('/')} className="text-sm font-medium text-gray-300 hover:text-white relative group">Home <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-[#00D9FF] to-[#B721FF] transition-all duration-300 group-hover:w-full" /></button>
          <button onClick={() => handleNav('#services')} className="text-sm font-medium text-gray-300 hover:text-white relative group">Servizi <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-[#00D9FF] to-[#B721FF] transition-all duration-300 group-hover:w-full" /></button>
          <Link to="/works" className="text-sm font-medium text-gray-300 hover:text-white relative group">Progetti <span className="absolute -bottom-1 left-0 w-0 h-0.5 bg-gradient-to-r from-[#00D9FF] to-[#B721FF] transition-all duration-300 group-hover:w-full" /></Link>
          <button onClick={() => handleNav('#contact')} className="px-6 py-2 bg-white/10 hover:bg-white/20 border border-white/10 rounded-full text-sm font-medium transition-all text-white">Contattaci</button>
        </div>
        <button className="md:hidden text-white" onClick={() => setMobileMenuOpen(!mobileMenuOpen)}>{mobileMenuOpen ? <X /> : <Menu />}</button>
      </div>
      {mobileMenuOpen && <div className="absolute top-full w-full bg-[#0a0a0a] p-6 flex flex-col gap-4 border-b border-white/10"><button onClick={() => handleNav('/')}>Home</button><button onClick={() => handleNav('#services')}>Servizi</button><Link to="/works">Progetti</Link><button onClick={() => handleNav('#contact')}>Contatti</button></div>}
    </nav>
  );
};
export default Navbar;
EOF

# Hero (con Link)
cat > src/components/Hero.jsx << 'EOF'
import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

const Hero = () => {
  const scrollToServices = () => document.getElementById('services')?.scrollIntoView({ behavior: 'smooth' });
  return (
    <section className="relative min-h-screen flex items-center pt-20 overflow-hidden">
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none"><div className="absolute top-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#00D9FF]/10 rounded-full blur-[120px] animate-pulse-slow" /><div className="absolute bottom-[-10%] right-[-10%] w-[50%] h-[50%] bg-[#B721FF]/10 rounded-full blur-[120px] animate-pulse-slow delay-1000" /><div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full h-full opacity-20 bg-[url('https://grainy-gradients.vercel.app/noise.svg')]" /></div>
      <div className="container mx-auto px-6 relative z-10">
        <div className="max-w-4xl">
          <div className="inline-block px-4 py-1.5 mb-6 border border-[#00D9FF]/30 rounded-full bg-[#00D9FF]/5 backdrop-blur-md"><span className="text-[#00D9FF] text-xs font-bold tracking-widest uppercase">Agenzia Digitale Premium</span></div>
          <h1 className="text-5xl md:text-7xl lg:text-8xl font-bold leading-tight mb-8">Plasmiamo il <br /><span className="text-transparent bg-clip-text bg-gradient-to-r from-[#00D9FF] via-white to-[#B721FF] animate-gradient">Futuro Digitale</span></h1>
          <p className="text-xl text-gray-400 max-w-2xl mb-10">Trasformiamo aziende visionarie attraverso design sofisticato e tecnologia all'avanguardia.</p>
          <div className="flex flex-col sm:flex-row gap-4">
            <Link to="/works" className="group px-8 py-4 bg-[#00D9FF] text-black font-bold rounded-full hover:scale-105 transition-transform flex items-center justify-center gap-2">Esplora i Lavori <ArrowRight className="w-4 h-4" /></Link>
            <button onClick={scrollToServices} className="px-8 py-4 border border-white/20 hover:bg-white/5 rounded-full font-medium transition-all text-white">I Nostri Servizi</button>
          </div>
        </div>
      </div>
    </section>
  );
};
export default Hero;
EOF

# Services
cat > src/components/Services.jsx << 'EOF'
import React from 'react';
import { SERVICES } from '../data/constants';

const Services = () => (
  <section id="services" className="py-24 bg-[#050505] relative">
    <div className="container mx-auto px-6">
      <div className="flex flex-col md:flex-row justify-between items-end mb-16">
        <div><h2 className="text-4xl md:text-5xl font-bold mb-4">I Nostri Servizi</h2><div className="h-1 w-20 bg-gradient-to-r from-[#00D9FF] to-[#B721FF]" /></div>
        <p className="text-gray-400 max-w-md mt-6 md:mt-0">Soluzioni su misura per brand che non si accontentano dell'ordinario.</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {SERVICES.map((s) => (
          <div key={s.id} className="group p-8 border border-white/5 bg-white/5 rounded-2xl hover:border-[#B721FF]/50 transition-all cursor-none">
            <s.icon className="w-8 h-8 mb-6 text-[#00D9FF] group-hover:text-[#B721FF] transition-colors" />
            <h3 className="text-xl font-bold mb-3 text-white">{s.title}</h3>
            <p className="text-sm text-gray-400">{s.desc}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);
export default Services;
EOF

# ProjectsSection
cat > src/components/ProjectsSection.jsx << 'EOF'
import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { PROJECTS } from '../data/constants';

const ProjectsSection = () => (
  <section className="py-24 relative overflow-hidden">
    <div className="container mx-auto px-6">
      <div className="flex justify-between items-end mb-16">
        <h2 className="text-4xl md:text-5xl font-bold">Progetti Recenti</h2>
        <Link to="/works" className="hidden md:flex items-center gap-2 text-[#00D9FF] hover:text-white transition-colors">Vedi Tutti <ArrowRight className="w-4 h-4" /></Link>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {PROJECTS.slice(0, 2).map((p) => (
          <Link to="/works" key={p.id} className="group relative h-[400px] rounded-3xl overflow-hidden border border-white/10 block">
            <img src={p.image} alt={p.title} loading="lazy" className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
            <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-transparent to-transparent opacity-90" />
            <div className="absolute bottom-0 left-0 w-full p-8"><h3 className="text-3xl font-bold text-white mb-2">{p.title}</h3><span className="text-[#00D9FF]">{p.category}</span></div>
          </Link>
        ))}
      </div>
      <Link to="/works" className="md:hidden mt-8 block w-full py-4 text-center border border-white/20 rounded-full text-white">Vedi Tutti i Progetti</Link>
    </div>
  </section>
);
export default ProjectsSection;
EOF

# ContactForm
cat > src/components/ContactForm.jsx << 'EOF'
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
EOF

# Footer
cat > src/components/Footer.jsx << 'EOF'
import React from 'react';
import { Instagram, Linkedin, Twitter } from 'lucide-react';
import { Link } from 'react-router-dom';

const Footer = ({ setOpenCookies }) => (
  <footer className="bg-[#020202] border-t border-white/5 pt-16 pb-8">
    <div className="container mx-auto px-6">
      <div className="grid md:grid-cols-4 gap-12 mb-16">
        <div className="col-span-2">
          <div className="text-2xl font-bold mb-6">PRIMA<span className="text-[#00D9FF]">.</span>STUDIO</div>
          <p className="text-gray-400 text-sm max-w-sm mb-8">Agenzia di digital design pluripremiata.</p>
          <div className="flex gap-4 text-white">{[Instagram, Linkedin, Twitter].map((I, i) => <div key={i} className="w-10 h-10 bg-white/5 rounded-full flex items-center justify-center hover:bg-[#00D9FF] hover:text-black transition-all cursor-pointer"><I className="w-5 h-5" /></div>)}</div>
        </div>
        <div><h4 className="font-bold text-white mb-6">Agenzia</h4><ul className="space-y-4 text-sm text-gray-400"><li><Link to="/" className="hover:text-[#00D9FF]">Home</Link></li><li><Link to="/works" className="hover:text-[#00D9FF]">Progetti</Link></li></ul></div>
        <div><h4 className="font-bold text-white mb-6">Legale</h4><ul className="space-y-4 text-sm text-gray-400"><li><Link to="/privacy" className="hover:text-[#00D9FF]">Privacy</Link></li><li><Link to="/terms" className="hover:text-[#00D9FF]">Termini</Link></li><li><button onClick={() => setOpenCookies(true)} className="hover:text-[#00D9FF]">Cookie</button></li></ul></div>
      </div>
      <div className="border-t border-white/5 pt-8 text-center text-xs text-gray-600">© 2025 Prima Studio Agency.</div>
    </div>
  </footer>
);
export default Footer;
EOF

# CookieBanner
cat > src/components/CookieBanner.jsx << 'EOF'
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
EOF

# 6. Pagine (Pages)

# Home.jsx
cat > src/pages/Home.jsx << 'EOF'
import React from 'react';
import { Helmet } from 'react-helmet-async';
import Hero from '../components/Hero';
import Services from '../components/Services';
import ProjectsSection from '../components/ProjectsSection';
import ContactForm from '../components/ContactForm';

const Home = () => (
  <div className="animate-in fade-in duration-700">
    <Helmet>
      <title>Prima Studio | Agenzia Web Design Premium</title>
      <meta name="description" content="Trasformiamo aziende visionarie attraverso design sofisticato e tecnologia all'avanguardia." />
    </Helmet>
    <Hero />
    <Services />
    <ProjectsSection />
    <ContactForm />
  </div>
);
export default Home;
EOF

# Works.jsx
cat > src/pages/Works.jsx << 'EOF'
import React from 'react';
import { Helmet } from 'react-helmet-async';
import { PROJECTS } from '../data/constants';
import { Link } from 'react-router-dom';

const Works = () => (
  <div className="pt-32 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
    <Helmet>
      <title>Progetti | Prima Studio</title>
      <meta name="description" content="Esplora i nostri lavori più recenti e innovativi." />
    </Helmet>
    <h1 className="text-5xl font-bold mb-6 text-center">I Nostri Lavori</h1>
    <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
      {PROJECTS.map((p) => (
        <div key={p.id} className="group bg-white/5 border border-white/10 rounded-3xl overflow-hidden">
          <img src={p.image} alt={p.title} loading="lazy" className="w-full h-[300px] object-cover group-hover:scale-110 transition-transform duration-700" />
          <div className="p-8"><h3 className="text-2xl font-bold mb-2 text-white">{p.title}</h3><p className="text-gray-400 text-sm">{p.desc}</p></div>
        </div>
      ))}
    </div>
    <div className="mt-12 text-center"><Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full">Torna alla Home</Link></div>
  </div>
);
export default Works;
EOF

# Legal.jsx
cat > src/pages/Legal.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';

const Legal = ({ title, content }) => (
  <div className="pt-40 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
     <Helmet><title>{title} | Prima Studio</title></Helmet>
     <Link to="/" className="mb-8 text-gray-500 hover:text-white block">&larr; Torna alla Home</Link>
     <h1 className="text-5xl font-bold mb-8 text-white">{title}</h1>
     <div className="prose prose-invert max-w-3xl"><p className="text-xl text-gray-400">{content}</p></div>
  </div>
);
export default Legal;
EOF

# NotFound.jsx
cat > src/pages/NotFound.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';

const NotFound = () => (
  <div className="h-screen flex flex-col items-center justify-center text-center p-6">
    <Helmet><title>404 | Pagina non trovata</title></Helmet>
    <h1 className="text-9xl font-bold text-[#00D9FF] mb-4">404</h1>
    <p className="text-xl text-gray-400 mb-8">Pagina non trovata.</p>
    <Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full">Torna alla Home</Link>
  </div>
);
export default NotFound;
EOF

# 7. Entry Points

# App.jsx (Routing & Layout)
cat > src/App.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { Routes, Route, useLocation } from 'react-router-dom';
import CustomCursor from './components/CustomCursor';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import CookieBanner from './components/CookieBanner';
import Home from './pages/Home';
import Works from './pages/Works';
import Legal from './pages/Legal';
import NotFound from './pages/NotFound';

const ScrollToTop = () => {
  const { pathname } = useLocation();
  useEffect(() => { if (!pathname.includes('#')) window.scrollTo(0, 0); }, [pathname]);
  return null;
};

const App = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [openCookies, setOpenCookies] = useState(false);

  useEffect(() => { setTimeout(() => setIsLoading(false), 1500); }, []);

  if (isLoading) return <div className="fixed inset-0 bg-black z-50 flex items-center justify-center text-white"><div className="text-center"><div className="text-4xl font-bold mb-4 animate-pulse">PRIMA<span className="text-[#00D9FF]">.</span></div><div className="w-32 h-1 bg-gray-800 rounded-full overflow-hidden mx-auto"><div className="w-full h-full bg-[#00D9FF] animate-loading-bar origin-left" /></div></div></div>;

  return (
    <div className="min-h-screen bg-[#0a0a0a] text-white font-sans selection:bg-[#00D9FF] selection:text-black overflow-x-hidden">
      <ScrollToTop />
      <CustomCursor />
      <Navbar />
      <main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/works" element={<Works />} />
          <Route path="/privacy" element={<Legal title="Privacy Policy" content="Informativa Privacy conforme al GDPR (Placeholder)." />} />
          <Route path="/terms" element={<Legal title="Termini e Condizioni" content="Termini di servizio (Placeholder)." />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </main>
      <Footer setOpenCookies={setOpenCookies} />
      <CookieBanner openPreferences={openCookies} setOpenPreferences={setOpenCookies} />
    </div>
  );
};
export default App;
EOF

# main.jsx (Providers)
cat > src/main.jsx << 'EOF'
import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter } from 'react-router-dom'
import { HelmetProvider } from 'react-helmet-async'
import App from './App.jsx'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <HelmetProvider>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </HelmetProvider>
  </React.StrictMode>,
)
EOF

# 8. Backend (API)

cat > api/send.js << 'EOF'
export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader('Access-Control-Allow-Headers', 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version');

  if (req.method === 'OPTIONS') { res.status(200).end(); return; }
  if (req.method !== 'POST') { return res.status(405).json({ error: 'Method not allowed' }); }

  try {
    const { name, email, phone, message } = req.body;
    const apiKey = process.env.VITE_RESEND_API_KEY;
    if (!apiKey) return res.status(500).json({ error: 'API Key mancante' });

    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${apiKey}` },
      body: JSON.stringify({
        from: 'onboarding@resend.dev',
        to: 'info@prima-studio-agency.com',
        subject: `Lead: ${name}`,
        html: `<p>Nome: ${name}</p><p>Email: ${email}</p><p>Tel: ${phone}</p><p>${message}</p>`
      })
    });

    const data = await response.json();
    if (!response.ok) return res.status(response.status).json(data);
    return res.status(200).json(data);
  } catch (error) {
    return res.status(500).json({ error: 'Internal Error' });
  }
}
EOF

echo "✅ Installazione Production Grade completata!"
echo "👉 1. Esegui 'npm install' (installerà le nuove dipendenze come il router e helmet)"
echo "👉 2. Esegui 'npm run dev'"