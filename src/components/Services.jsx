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
