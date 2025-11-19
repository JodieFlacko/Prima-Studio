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
