import React from 'react';
import { Link } from 'react-router-dom';
import { Helmet } from 'react-helmet-async';

const NotFound = () => (
  <div className="h-screen flex flex-col items-center justify-center text-center p-6">
    <Helmet><title>404 | Pagina non trovata</title></Helmet>
    <h1 className="text-9xl font-bold text-[#00D9FF] mb-4">404</h1>
    <p className="text-xl text-gray-400 mb-8">Pagina non trovata.</p>
    <Link to="/" className="px-8 py-4 bg-white text-black font-bold rounded-full hover:bg-gray-200 transition-colors">Torna alla Home</Link>
  </div>
);
export default NotFound;
