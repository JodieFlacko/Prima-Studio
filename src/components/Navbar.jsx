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
