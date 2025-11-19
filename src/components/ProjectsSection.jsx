import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { PROJECTS } from '../data/constants';

const ProjectsSection = () => (
  <section className="py-24 relative overflow-hidden">
    <div className="container mx-auto px-6">
      <div className="flex justify-between items-end mb-16">
        <h2 className="text-4xl md:text-5xl font-bold">Progetti Recenti</h2>
        <Link to="/works" className="hidden md:flex items-center gap-2 text-[#00D9FF] hover:text-white transition-colors">Vedi Tutti <ArrowRight className="w-4 h-4" /></Link>
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {PROJECTS.slice(0, 2).map((p) => (
          <Link to="/works" key={p.id} className="group relative h-[400px] rounded-3xl overflow-hidden border border-white/10 block">
            <img src={p.image} alt={p.title} loading="lazy" className="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
            <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-transparent to-transparent opacity-90" />
            <div className="absolute bottom-0 left-0 w-full p-8"><h3 className="text-3xl font-bold text-white mb-2">{p.title}</h3><span className="text-[#00D9FF]">{p.category}</span></div>
          </Link>
        ))}
      </div>
      <Link to="/works" className="md:hidden mt-8 block w-full py-4 text-center border border-white/20 rounded-full text-white">Vedi Tutti i Progetti</Link>
    </div>
  </section>
);
export default ProjectsSection;
