import React from 'react';
import { SERVICES } from '../data/constants';
const Services = () => (
  <section id="services" className="py-24 bg-[#050505] relative overflow-hidden content-visibility-auto" aria-labelledby="services-heading">
    <div className="absolute top-1/2 left-1/4 w-96 h-96 bg-[#00D9FF]/5 rounded-full blur-[128px] pointer-events-none gpu" />
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
