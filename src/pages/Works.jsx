import React from 'react';
import { Helmet } from 'react-helmet-async';
import { PROJECTS } from '../data/constants';
import { Link } from 'react-router-dom';

const Works = () => (
  <div className="pt-32 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
    <Helmet>
      <title>Progetti | Prima Studio</title>
      <meta name="description" content="Esplora i nostri lavori più recenti e innovativi." />
    </Helmet>
    <h1 className="text-5xl font-bold mb-6 text-center">I Nostri Lavori</h1>
    <div className="grid grid-cols-1 md:grid-cols-2 gap-8 mt-12">
      {PROJECTS.map((p) => (
        <div key={p.id} className="group bg-white/5 border border-white/10 rounded-3xl overflow-hidden">
          <img src={p.image} alt={p.title} loading="lazy" className="w-full h-[300px] object-cover group-hover:scale-110 transition-transform duration-700" />
          <div className="p-8"><h3 className="text-2xl font-bold mb-2 text-white">{p.title}</h3><p className="text-gray-400 text-sm">{p.desc}</p></div>
        </div>
      ))}
    </div>
    <div className="mt-12 text-center"><Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full">Torna alla Home</Link></div>
  </div>
);
export default Works;
