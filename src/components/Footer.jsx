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
