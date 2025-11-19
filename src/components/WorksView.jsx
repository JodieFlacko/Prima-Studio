import React from 'react';
import { ExternalLink } from 'lucide-react';
import { PROJECTS } from '../data/constants';

const WorksView = ({ setPage }) => {
  return (
    <div className="pt-32 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in slide-in-from-bottom-4 duration-500">
      <div className="text-center max-w-3xl mx-auto mb-20">
        <h1 className="text-5xl md:text-7xl font-bold mb-6 text-white">I Nostri Lavori</h1>
        <p className="text-gray-400 text-xl">Una selezione dei progetti più sfidanti e innovativi che abbiamo realizzato per i nostri clienti globali.</p>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {PROJECTS.map((project) => (
          <div key={project.id} className="group relative rounded-3xl overflow-hidden bg-white/5 border border-white/10 hover:border-[#00D9FF]/50 transition-all duration-500">
            <div className="h-[300px] overflow-hidden"><img src={project.image} alt={`Screenshot del progetto ${project.title}`} loading="lazy" className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" /></div>
            <div className="p-8">
              <div className="flex justify-between items-start mb-4"><div><span className="text-[#00D9FF] text-xs font-bold uppercase tracking-wider mb-1 block">{project.category}</span><h3 className="text-2xl font-bold text-white">{project.title}</h3></div><div className="bg-white/10 p-2 rounded-full"><ExternalLink className="w-5 h-5 text-gray-300" /></div></div>
              <p className="text-gray-400 mb-6 text-sm">{project.desc}</p>
              <div className="inline-block px-3 py-1 bg-[#B721FF]/10 rounded-full border border-[#B721FF]/20 text-[#B721FF] text-xs font-bold">{project.stats}</div>
            </div>
          </div>
        ))}
      </div>
      <div className="mt-20 text-center"><button onClick={() => setPage('home')} className="px-8 py-4 bg-white text-black font-bold rounded-full hover:bg-gray-200 transition-colors">Torna alla Home</button></div>
    </div>
  );
};
export default WorksView;
