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
