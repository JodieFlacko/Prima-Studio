import React from 'react';
import { Helmet } from 'react-helmet-async';
import { PROJECTS } from '../data/constants';
import { Link } from 'react-router-dom';
import { ExternalLink } from 'lucide-react';
const Works = () => (
  <div className="pt-32 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
    <Helmet><title>Progetti | Prima Studio</title><meta name="description" content="I nostri lavori." /></Helmet>
    <h1 className="text-5xl font-bold mb-6 text-center text-white">I Nostri Lavori</h1>
    <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
      {PROJECTS.map((p) => (
        <div key={p.id} className="group bg-white/5 border border-white/10 rounded-3xl overflow-hidden">
          <img src={p.image} alt={`Progetto ${p.title}`} loading="lazy" width="800" height="600" className="w-full h-[300px] object-cover group-hover:scale-110 transition-transform duration-700" />
          <div className="p-8"><div className="flex justify-between items-start mb-4"><div><span className="text-[#00D9FF] text-xs font-bold uppercase tracking-wider mb-1 block">{p.category}</span><h3 className="text-2xl font-bold text-white">{p.title}</h3></div><div className="bg-white/10 p-2 rounded-full"><ExternalLink className="w-5 h-5 text-gray-300" /></div></div><p className="text-gray-400 text-sm">{p.desc}</p></div>
        </div>
      ))}
    </div>
    <div className="mt-12 text-center"><Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full hover:bg-gray-200 transition-colors focus:outline-none">Torna alla Home</Link></div>
  </div>
);
export default Works;
