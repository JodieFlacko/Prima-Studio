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
      if (location.pathname === '/') { document.getElementById(target.substring(1))?.scrollIntoView({ behavior: 'smooth' }); }
      else { navigate('/'); setTimeout(() => document.getElementById(target.substring(1))?.scrollIntoView({ behavior: 'smooth' }), 100); }
    } else { navigate(target); window.scrollTo(0, 0); }
  };
  return (
    <nav className={`fixed w-full z-50 transition-all duration-500 ${scrolled ? 'bg-[#050505]/90 backdrop-blur-xl border-b border-white/5 py-4' : 'bg-transparent py-6'}`} role="navigation" aria-label="Principale">
      <div className="container mx-auto px-6 flex justify-between items-center">
        <Link to="/" className="text-2xl font-bold tracking-tighter focus:outline-none rounded-lg px-2" onClick={() => window.scrollTo(0,0)} aria-label="Home">PRIMA<span className="text-[#00D9FF]">.</span>STUDIO</Link>
        <div className="hidden md:flex items-center gap-8">
          <button onClick={() => handleNav('/')} className="text-sm font-medium text-gray-300 hover:text-white hover:underline decoration-[#00D9FF] underline-offset-4 transition-all focus:outline-none">Home</button>
          <button onClick={() => handleNav('#services')} className="text-sm font-medium text-gray-300 hover:text-white hover:underline decoration-[#00D9FF] underline-offset-4 transition-all focus:outline-none">Servizi</button>
          <Link to="/works" className="text-sm font-medium text-gray-300 hover:text-white hover:underline decoration-[#00D9FF] underline-offset-4 transition-all focus:outline-none">Progetti</Link>
          <button onClick={() => handleNav('#contact')} className="px-6 py-2 bg-white/10 hover:bg-white/20 border border-white/10 rounded-full text-sm font-medium transition-all text-white focus:outline-none">Contattaci</button>
        </div>
        <button className="md:hidden text-white p-2 focus:outline-none rounded-lg" onClick={() => setMobileMenuOpen(!mobileMenuOpen)} aria-label="Menu">{mobileMenuOpen ? <X /> : <Menu />}</button>
      </div>
      {mobileMenuOpen && <div className="absolute top-full left-0 w-full bg-[#0a0a0a] border-b border-white/10 p-6 flex flex-col gap-4 shadow-2xl"><button onClick={() => handleNav('/')} className="text-left text-lg font-medium text-gray-200 py-3 border-b border-white/5 focus:outline-none">Home</button><button onClick={() => handleNav('#services')} className="text-left text-lg font-medium text-gray-200 py-3 border-b border-white/5 focus:outline-none">Servizi</button><Link to="/works" onClick={() => setMobileMenuOpen(false)} className="text-left text-lg font-medium text-gray-200 py-3 border-b border-white/5 focus:outline-none">Progetti</Link><button onClick={() => handleNav('#contact')} className="text-left text-lg font-medium text-[#00D9FF] py-3 font-bold focus:outline-none">Contattaci</button></div>}
    </nav>
  );
};
export default Navbar;
