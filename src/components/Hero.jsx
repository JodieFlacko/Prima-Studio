import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
const Hero = () => {
  const scrollToServices = () => document.getElementById('services')?.scrollIntoView({ behavior: 'smooth' });
  return (
    <section className="relative min-h-screen flex items-center pt-20 overflow-hidden gpu" aria-label="Introduzione">
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none" aria-hidden="true">
        <div className="absolute top-[-10%] left-[-10%] w-[50%] h-[50%] bg-[#00D9FF]/10 rounded-full blur-[120px] animate-pulse-slow gpu" />
        <div className="absolute bottom-[-10%] right-[-10%] w-[50%] h-[50%] bg-[#B721FF]/10 rounded-full blur-[120px] animate-pulse-slow delay-1000 gpu" />
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-full h-full opacity-20 bg-[url('https://grainy-gradients.vercel.app/noise.svg')]" />
      </div>
      <div className="container mx-auto px-6 relative z-10">
        <div className="max-w-4xl">
          <div className="inline-block px-4 py-1.5 mb-6 border border-[#00D9FF]/30 rounded-full bg-[#00D9FF]/5 backdrop-blur-md"><span className="text-[#00D9FF] text-xs font-bold tracking-widest uppercase">Agenzia Digitale Premium</span></div>
          <h1 className="text-5xl md:text-7xl lg:text-8xl font-bold leading-tight mb-8 text-white">Plasmiamo il <br /><span className="text-transparent bg-clip-text bg-gradient-to-r from-[#00D9FF] via-white to-[#B721FF] animate-gradient">Futuro Digitale</span></h1>
          <p className="text-xl text-gray-300 max-w-2xl mb-10 leading-relaxed">Trasformiamo aziende visionarie attraverso design sofisticato e tecnologia all'avanguardia.</p>
          <div className="flex flex-col sm:flex-row gap-4">
            <Link to="/works" className="group px-8 py-4 bg-[#00D9FF] hover:bg-[#00b8d9] text-black font-bold rounded-full hover:scale-105 transition-all flex items-center justify-center gap-2 focus:outline-none">Esplora i Lavori <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform" aria-hidden="true" /></Link>
            <button onClick={scrollToServices} className="px-8 py-4 border border-white/20 hover:bg-white/5 hover:border-white/50 rounded-full font-medium transition-all text-white focus:outline-none">I Nostri Servizi</button>
          </div>
        </div>
      </div>
    </section>
  );
};
export default Hero;
