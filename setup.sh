#!/bin/bash

echo "🚀 Aggiornamento finale Prima Studio (Global Focus Fix)..."

# 1. Pulizia e Creazione Struttura
rm -rf src api
mkdir -p src/components
mkdir -p src/pages
mkdir -p src/data
mkdir -p api

# 2. Configurazione Dipendenze
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
    "react-helmet-async": "^2.0.4",
    "@vercel/speed-insights": "^1.0.0"
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
cat > vite.config.js << 'EOF'
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
})
EOF

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

cat > postcss.config.js << 'EOF'
export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

cat > .gitignore << 'EOF'
node_modules/
dist/
.env
.env.local
.DS_Store
EOF

# Non sovrascriviamo .env se esiste già
if [ ! -f .env ]; then
cat > .env << 'EOF'
VITE_RESEND_API_KEY=re_123456_la_tua_chiave_qui
EOF
fi

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

# CSS GLOBALE CON FIX PER IL FOCUS
cat > src/index.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  /* Rimuove il colore di highlight blu al tocco su mobile */
  * {
    -webkit-tap-highlight-color: transparent;
  }
  
  /* Rimuove forzatamente outline e ring di focus da TUTTI gli elementi */
  *:focus, *:active, button:focus, a:focus {
    outline: none !important;
    box-shadow: none !important;
    border-color: transparent; /* Reset di sicurezza */
  }

  /* Eccezione per gli input del form che gestiscono il loro bordo */
  input:focus, textarea:focus {
    border-color: #00D9FF !important;
    box-shadow: none !important;
    outline: none !important;
  }
}

@keyframes loading-bar { 0% { transform: scaleX(0); } 100% { transform: scaleX(1); } }
.animate-loading-bar { animation: loading-bar 1.5s cubic-bezier(0.4, 0, 0.2, 1) forwards; }
.animate-slide-up { animation: slideUp 0.5s ease-out forwards; }
@keyframes slideUp { from { transform: translateY(100%); opacity: 0; } to { transform: translateY(0); opacity: 1; } }

.no-scrollbar::-webkit-scrollbar { display: none; }
.no-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }
EOF

# 4. Dati
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

# 5. Componenti

# CustomCursor
cat > src/components/CustomCursor.jsx << 'EOF'
import React, { useState, useEffect } from 'react';

const CustomCursor = () => {
  const [pos, setPos] = useState({ x: 0, y: 0 });
  const [visible, setVisible] = useState(false);
  const [clicked, setClicked] = useState(false);

  useEffect(() => {
    const move = (e) => { 
      // Aggiornamento diretto per evitare lag
      setPos({ x: e.clientX, y: e.clientY }); 
      setVisible(true); 
    };
    const leave = () => setVisible(false);
    const down = () => setClicked(true);
    const up = () => setClicked(false);
    
    window.addEventListener('mousemove', move);
    document.addEventListener('mouseleave', leave);
    window.addEventListener('mousedown', down);
    window.addEventListener('mouseup', up);
    
    return () => {
      window.removeEventListener('mousemove', move);
      document.removeEventListener('mouseleave', leave);
      window.removeEventListener('mousedown', down);
      window.removeEventListener('mouseup', up);
    };
  }, []);

  if (!visible) return null;

  return (
    <div 
      className={`
        fixed top-0 left-0 pointer-events-none z-[9999] 
        -translate-x-1/2 -translate-y-1/2 hidden lg:flex items-center justify-center
        rounded-full
        transition-[transform,background-color,border-color] duration-150 ease-out
        ${clicked 
          ? 'w-6 h-6 bg-[#00D9FF] border-transparent scale-90' 
          : 'w-8 h-8 border border-[#00D9FF] bg-transparent scale-100'
        }
      `}
      style={{ 
        left: pos.x, 
        top: pos.y,
        willChange: 'left, top' 
      }}
    >
      <div 
        className={`
          w-1 h-1 bg-white rounded-full 
          transition-opacity duration-150
          ${clicked ? 'opacity-0' : 'opacity-100'}
        `} 
      />
    </div>
  );
};
export default CustomCursor;
EOF

# Navbar
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
    <nav className={`fixed w-full z-50 transition-all duration-500 ${scrolled ? 'bg-[#050505]/90 backdrop-blur-xl border-b border-white/5 py-4' : 'bg-transparent py-6'}`} role="navigation" aria-label="Principale">
      <div className="container mx-auto px-6 flex justify-between items-center">
        <Link to="/" className="text-2xl font-bold tracking-tighter rounded-lg px-2" onClick={() => window.scrollTo(0,0)} aria-label="Prima Studio Home">PRIMA<span className="text-[#00D9FF]">.</span>STUDIO</Link>
        <div className="hidden md:flex items-center gap-8">
          <button onClick={() => handleNav('/')} className="text-sm font-medium text-gray-300 hover:text-white hover:underline decoration-[#00D9FF] underline-offset-4 transition-all">Home</button>
          <button onClick={() => handleNav('#services')} className="text-sm font-medium text-gray-300 hover:text-white hover:underline decoration-[#00D9FF] underline-offset-4 transition-all">Servizi</button>
          <Link to="/works" className="text-sm font-medium text-gray-300 hover:text-white hover:underline decoration-[#00D9FF] underline-offset-4 transition-all">Progetti</Link>
          <button onClick={() => handleNav('#contact')} className="px-6 py-2 bg-white/10 hover:bg-white/20 border border-white/10 rounded-full text-sm font-medium transition-all text-white">Contattaci</button>
        </div>
        <button className="md:hidden text-white p-2 rounded-lg" onClick={() => setMobileMenuOpen(!mobileMenuOpen)} aria-label={mobileMenuOpen ? "Chiudi menu navigazione" : "Apri menu navigazione"} aria-expanded={mobileMenuOpen}>{mobileMenuOpen ? <X aria-hidden="true" /> : <Menu aria-hidden="true" />}</button>
      </div>
      {mobileMenuOpen && (
        <div className="absolute top-full left-0 w-full bg-[#0a0a0a] border-b border-white/10 p-6 flex flex-col gap-4 shadow-2xl">
          <button onClick={() => handleNav('/')} className="text-left text-lg font-medium text-gray-200 py-3 border-b border-white/5">Home</button>
          <button onClick={() => handleNav('#services')} className="text-left text-lg font-medium text-gray-200 py-3 border-b border-white/5">Servizi</button>
          <Link to="/works" onClick={() => setMobileMenuOpen(false)} className="text-left text-lg font-medium text-gray-200 py-3 border-b border-white/5">Progetti</Link>
          <button onClick={() => handleNav('#contact')} className="text-left text-lg font-medium text-[#00D9FF] py-3 font-bold">Contattaci</button>
        </div>
      )}
    </nav>
  );
};
export default Navbar;
EOF

# Hero
cat > src/components/Hero.jsx << 'EOF'
import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';

const Hero = () => {
  const scrollToServices = () => document.getElementById('services')?.scrollIntoView({ behavior: 'smooth' });
  return (
    <section className="relative min-h-screen flex items-center pt-20 overflow-hidden" aria-label="Introduzione">
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none" aria-hidden="true"><div className="absolute top-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#00D9FF]/10 rounded-full blur-[120px] animate-pulse-slow" /><div className="absolute bottom-[-10%] right-[-10%] w-[50%] h-[50%] bg-[#B721FF]/10 rounded-full blur-[120px] animate-pulse-slow delay-1000" /><div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full h-full opacity-20 bg-[url('https://grainy-gradients.vercel.app/noise.svg')]" /></div>
      <div className="container mx-auto px-6 relative z-10">
        <div className="max-w-4xl">
          <div className="inline-block px-4 py-1.5 mb-6 border border-[#00D9FF]/30 rounded-full bg-[#00D9FF]/5 backdrop-blur-md"><span className="text-[#00D9FF] text-xs font-bold tracking-widest uppercase">Agenzia Digitale Premium</span></div>
          <h1 className="text-5xl md:text-7xl lg:text-8xl font-bold leading-tight mb-8 text-white">Plasmiamo il <br /><span className="text-transparent bg-clip-text bg-gradient-to-r from-[#00D9FF] via-white to-[#B721FF] animate-gradient">Futuro Digitale</span></h1>
          <p className="text-xl text-gray-300 max-w-2xl mb-10 leading-relaxed">Trasformiamo aziende visionarie attraverso design sofisticato e tecnologia all'avanguardia.</p>
          <div className="flex flex-col sm:flex-row gap-4">
            <Link to="/works" className="group px-8 py-4 bg-[#00D9FF] hover:bg-[#00b8d9] text-black font-bold rounded-full hover:scale-105 transition-all flex items-center justify-center gap-2">Esplora i Lavori <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" aria-hidden="true" /></Link>
            <button onClick={scrollToServices} className="px-8 py-4 border border-white/20 hover:bg-white/5 hover:border-white/50 rounded-full font-medium transition-all text-white">I Nostri Servizi</button>
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
  <section id="services" className="py-24 bg-[#050505] relative overflow-hidden" aria-labelledby="services-heading">
    <div className="absolute top-1/2 left-1/4 w-96 h-96 bg-[#00D9FF]/5 rounded-full blur-[128px] pointer-events-none" />
    <div className="container mx-auto px-6 relative z-10">
      <div className="flex flex-col md:flex-row justify-between items-end mb-16">
        <div><h2 id="services-heading" className="text-4xl md:text-5xl font-bold mb-4 text-white">I Nostri Servizi</h2><div className="h-1 w-20 bg-gradient-to-r from-[#00D9FF] to-[#B721FF]" aria-hidden="true" /></div>
        <p className="text-gray-300 max-w-md mt-6 md:mt-0 leading-relaxed">Soluzioni su misura per brand che non si accontentano dell'ordinario.</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {SERVICES.map((s) => (
          <div key={s.id} className="group p-8 rounded-2xl border border-white/5 bg-white/5 backdrop-blur-sm hover:border-[#B721FF]/50 hover:bg-white/10 transition-all duration-500 ease-out hover:-translate-y-2 hover:shadow-[0_10px_40px_-10px_rgba(183,33,255,0.3)] cursor-default relative overflow-hidden">
            <div className="absolute inset-0 bg-gradient-to-br from-[#B721FF]/0 to-[#B721FF]/10 opacity-0 group-hover:opacity-100 transition-opacity duration-500" />
            <div className="relative z-10">
              <div className="mb-6 inline-block p-3 rounded-lg bg-white/5 text-[#00D9FF] group-hover:text-[#B721FF] group-hover:scale-110 group-hover:bg-white/10 transition-all duration-300"><s.icon className="w-8 h-8" aria-hidden="true" /></div>
              <h3 className="text-xl font-bold mb-3 text-white group-hover:text-[#00D9FF] transition-colors">{s.title}</h3>
              <p className="text-sm text-gray-300 leading-relaxed group-hover:text-white transition-colors">{s.desc}</p>
            </div>
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
  <section className="py-24 relative overflow-hidden" aria-labelledby="projects-heading">
    <div className="container mx-auto px-6">
      <div className="flex justify-between items-end mb-16">
        <h2 id="projects-heading" className="text-4xl md:text-5xl font-bold text-white">Progetti Recenti</h2>
        <Link to="/works" className="hidden md:flex items-center gap-2 text-[#00D9FF] hover:text-white hover:underline transition-colors rounded p-1">Vedi Tutti <ArrowRight className="w-4 h-4" aria-hidden="true" /></Link>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {PROJECTS.slice(0, 2).map((p) => (
          <Link to="/works" key={p.id} className="group relative h-[400px] rounded-3xl overflow-hidden border border-white/10 block" aria-label={`Vedi progetto ${p.title}`}>
            <img src={p.image} alt={`Screenshot del progetto ${p.title}`} loading="lazy" className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
            <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-transparent to-transparent opacity-90" />
            <div className="absolute bottom-0 left-0 w-full p-8"><h3 className="text-3xl font-bold text-white mb-2">{p.title}</h3><span className="text-[#00D9FF] font-medium">{p.category}</span></div>
          </Link>
        ))}
      </div>
      <Link to="/works" className="md:hidden mt-8 block w-full py-4 text-center border border-white/20 rounded-full text-white hover:bg-white/5 transition-colors">Vedi Tutti i Progetti</Link>
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
EOF

# Footer
cat > src/components/Footer.jsx << 'EOF'
import React from 'react';
import { Instagram, Linkedin, Twitter } from 'lucide-react';
import { Link } from 'react-router-dom';

const Footer = ({ setOpenCookies }) => (
  <footer className="bg-[#020202] border-t border-white/5 pt-16 pb-8 text-gray-300">
    <div className="container mx-auto px-6">
      <div className="grid md:grid-cols-4 gap-12 mb-16">
        <div className="col-span-2">
          <div className="text-2xl font-bold mb-6 text-white">PRIMA<span className="text-[#00D9FF]">.</span>STUDIO</div>
          <p className="text-gray-300 text-sm max-w-sm mb-8 leading-relaxed">Agenzia di digital design pluripremiata. Creiamo esperienze che connettono brand e persone.</p>
          <div className="flex gap-4 text-white">
            <a href="#" aria-label="Seguici su Instagram" className="w-10 h-10 bg-white/5 rounded-full flex items-center justify-center hover:bg-[#00D9FF] hover:text-black transition-all"><Instagram className="w-5 h-5" aria-hidden="true" /></a>
            <a href="#" aria-label="Seguici su LinkedIn" className="w-10 h-10 bg-white/5 rounded-full flex items-center justify-center hover:bg-[#00D9FF] hover:text-black transition-all"><Linkedin className="w-5 h-5" aria-hidden="true" /></a>
            <a href="#" aria-label="Seguici su Twitter" className="w-10 h-10 bg-white/5 rounded-full flex items-center justify-center hover:bg-[#00D9FF] hover:text-black transition-all"><Twitter className="w-5 h-5" aria-hidden="true" /></a>
          </div>
        </div>
        <nav aria-label="Link Agenzia">
          <h3 className="font-bold text-white mb-6 text-lg">Agenzia</h3>
          <ul className="space-y-4 text-sm text-gray-300"><li><Link to="/" className="hover:text-[#00D9FF] hover:underline transition-colors">Home</Link></li><li><Link to="/works" className="hover:text-[#00D9FF] hover:underline transition-colors">Progetti</Link></li></ul>
        </nav>
        <nav aria-label="Link Legali">
          <h3 className="font-bold text-white mb-6 text-lg">Legale</h3>
          <ul className="space-y-4 text-sm text-gray-300">
            <li><Link to="/privacy" className="hover:text-[#00D9FF] hover:underline transition-colors">Privacy Policy</Link></li>
            <li><Link to="/terms" className="hover:text-[#00D9FF] hover:underline transition-colors">Termini & Condizioni</Link></li>
            <li><Link to="/privacy" className="hover:text-[#00D9FF] hover:underline transition-colors">Cookie Policy</Link></li>
            <li><button onClick={() => setOpenCookies(true)} className="hover:text-[#00D9FF] hover:underline transition-colors text-left">Preferenze Cookie</button></li>
          </ul>
        </nav>
      </div>
      <div className="border-t border-white/5 pt-8 text-center text-xs text-gray-500">© 2025 Prima Studio Agency. P.IVA 12345678901. Tutti i diritti riservati.</div>
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
EOF

# WorksView
cat > src/components/WorksView.jsx << 'EOF'
import React from 'react';
import { ExternalLink } from 'lucide-react';
import { PROJECTS } from '../data/constants';

const WorksView = ({ setPage }) => {
  return (
    <div className="pt-32 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in slide-in-from-bottom-4 duration-500">
      <div className="text-center max-w-3xl mx-auto mb-20">
        <h1 className="text-5xl md:text-7xl font-bold mb-6 text-white">I Nostri Lavori</h1>
        <p className="text-gray-400 text-xl">Una selezione dei progetti più sfidanti e innovativi che abbiamo realizzato per i nostri clienti globali.</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {PROJECTS.map((project) => (
          <div key={project.id} className="group relative rounded-3xl overflow-hidden bg-white/5 border border-white/10 hover:border-[#00D9FF]/50 transition-all duration-500">
            <div className="h-[300px] overflow-hidden"><img src={project.image} alt={`Screenshot del progetto ${project.title}`} loading="lazy" className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" /></div>
            <div className="p-8">
              <div className="flex justify-between items-start mb-4"><div><span className="text-[#00D9FF] text-xs font-bold uppercase tracking-wider mb-1 block">{project.category}</span><h3 className="text-2xl font-bold text-white">{project.title}</h3></div><div className="bg-white/10 p-2 rounded-full"><ExternalLink className="w-5 h-5 text-gray-300" /></div></div>
              <p className="text-gray-400 mb-6 text-sm">{project.desc}</p>
              <div className="inline-block px-3 py-1 bg-[#B721FF]/10 rounded-full border border-[#B721FF]/20 text-[#B721FF] text-xs font-bold">{project.stats}</div>
            </div>
          </div>
        ))}
      </div>
      <div className="mt-20 text-center"><button onClick={() => setPage('home')} className="px-8 py-4 bg-white text-black font-bold rounded-full hover:bg-gray-200 transition-colors">Torna alla Home</button></div>
    </div>
  );
};
export default WorksView;
EOF

# 6. Pagine

cat > src/pages/Home.jsx << 'EOF'
import React from 'react';
import { Helmet } from 'react-helmet-async';
import Hero from '../components/Hero';
import Services from '../components/Services';
import ProjectsSection from '../components/ProjectsSection';
import ContactForm from '../components/ContactForm';

const Home = () => (
  <div className="animate-in fade-in duration-700">
    <Helmet><title>Prima Studio | Agenzia Web Design Premium</title><meta name="description" content="Trasformiamo aziende visionarie attraverso design sofisticato e tecnologia all'avanguardia." /></Helmet>
    <Hero />
    <Services />
    <ProjectsSection />
    <ContactForm />
  </div>
);
export default Home;
EOF

cat > src/pages/Works.jsx << 'EOF'
import React from 'react';
import { Helmet } from 'react-helmet-async';
import { PROJECTS } from '../data/constants';
import { Link } from 'react-router-dom';
import { ExternalLink } from 'lucide-react';

const Works = () => (
  <div className="pt-32 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
    <Helmet><title>Progetti | Prima Studio</title><meta name="description" content="Esplora i nostri lavori più recenti e innovativi." /></Helmet>
    <h1 className="text-5xl font-bold mb-6 text-center text-white">I Nostri Lavori</h1>
    <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
      {PROJECTS.map((p) => (
        <div key={p.id} className="group bg-white/5 border border-white/10 rounded-3xl overflow-hidden">
          <img src={p.image} alt={`Progetto ${p.title}`} loading="lazy" className="w-full h-[300px] object-cover group-hover:scale-110 transition-transform duration-700" />
          <div className="p-8">
            <div className="flex justify-between items-start mb-4"><div><span className="text-[#00D9FF] text-xs font-bold uppercase tracking-wider mb-1 block">{p.category}</span><h3 className="text-2xl font-bold text-white">{p.title}</h3></div><div className="bg-white/10 p-2 rounded-full"><ExternalLink className="w-5 h-5 text-gray-300" /></div></div>
            <p className="text-gray-400 text-sm">{p.desc}</p>
          </div>
        </div>
      ))}
    </div>
    <div className="mt-12 text-center"><Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full hover:bg-gray-200 transition-colors">Torna alla Home</Link></div>
  </div>
);
export default Works;
EOF

cat > src/pages/Legal.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';

const Legal = ({ title, content }) => (
  <div className="pt-40 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
     <Helmet><title>{title} | Prima Studio</title></Helmet>
     <Link to="/" className="mb-8 text-gray-500 hover:text-white block">&larr; Torna alla Home</Link>
     <h1 className="text-5xl font-bold mb-8 text-white">{title}</h1>
     <div className="prose prose-invert max-w-3xl"><p className="text-xl text-gray-300 leading-relaxed">{content}</p></div>
  </div>
);
export default Legal;
EOF

cat > src/pages/NotFound.jsx << 'EOF'
import React from 'react';
import { Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';

const NotFound = () => (
  <div className="h-screen flex flex-col items-center justify-center text-center p-6">
    <Helmet><title>404 | Pagina non trovata</title></Helmet>
    <h1 className="text-9xl font-bold text-[#00D9FF] mb-4">404</h1>
    <p className="text-xl text-gray-400 mb-8">Pagina non trovata.</p>
    <Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full hover:bg-gray-200 transition-colors">Torna alla Home</Link>
  </div>
);
export default NotFound;
EOF

# 7. Entry Points & API

cat > src/App.jsx << 'EOF'
import React, { useState, useEffect } from 'react';
import { Routes, Route, useLocation } from 'react-router-dom';
import { SpeedInsights } from '@vercel/speed-insights/react';
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
      <SpeedInsights />
    </div>
  );
};
export default App;
EOF

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

# API Serverless
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

echo "✅ Aggiornamento completato con successo!"
echo "👉 1. Esegui 'npm install' per installare le nuove dipendenze (Speed Insights, Helmet, ecc)"
echo "👉 2. Esegui 'npm run dev' per avviare il sito"