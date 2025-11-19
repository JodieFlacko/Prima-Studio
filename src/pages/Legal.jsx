import React from 'react';
import { Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';

const Legal = ({ title, content }) => (
  <div className="pt-40 pb-20 container mx-auto px-6 min-h-screen animate-in fade-in">
     <Helmet><title>{title} | Prima Studio</title></Helmet>
     <Link to="/" className="mb-8 text-gray-500 hover:text-white block">&larr; Torna alla Home</Link>
     <h1 className="text-5xl font-bold mb-8 text-white">{title}</h1>
     <div className="prose prose-invert max-w-3xl"><p className="text-xl text-gray-400">{content}</p></div>
  </div>
);
export default Legal;
