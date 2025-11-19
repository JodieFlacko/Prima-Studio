import React, { useState, useEffect } from 'react';
import { Routes, Route, useLocation } from 'react-router-dom';
import CustomCursor from './components/CustomCursor';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import CookieBanner from './components/CookieBanner';
import Home from './pages/Home';
import Works from './pages/Works';
import Legal from './pages/Legal';
import NotFound from './pages/NotFound';
import { SpeedInsights } from '@vercel/speed-insights/react';

const ScrollToTop = () => {
  const { pathname } = useLocation();
  useEffect(() => { if (!pathname.includes('#')) window.scrollTo(0, 0); }, [pathname]);
  return null;
};

const App = () => {
  const [isLoading, setIsLoading] = useState(true);
  const [openCookies, setOpenCookies] = useState(false);

  useEffect(() => { setTimeout(() => setIsLoading(false), 1500); }, []);

  if (isLoading) return <div className="fixed inset-0 bg-black z-50 flex items-center justify-center text-white"><div className="text-center"><div className="text-4xl font-bold mb-4 animate-pulse">PRIMA<span className="text-[#00D9FF]">.</span></div><div className="w-32 h-1 bg-gray-800 rounded-full overflow-hidden mx-auto"><div className="w-full h-full bg-[#00D9FF] animate-loading-bar origin-left" /></div></div></div>;

  return (
    <div className="min-h-screen bg-[#0a0a0a] text-white font-sans selection:bg-[#00D9FF] selection:text-black overflow-x-hidden">
      <ScrollToTop />
      <CustomCursor />
      <Navbar />
      <main>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/works" element={<Works />} />
          <Route path="/privacy" element={<Legal title="Privacy Policy" content="Informativa Privacy conforme al GDPR (Placeholder)." />} />
          <Route path="/terms" element={<Legal title="Termini e Condizioni" content="Termini di servizio (Placeholder)." />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
      </main>
      <Footer setOpenCookies={setOpenCookies} />
      <CookieBanner openPreferences={openCookies} setOpenPreferences={setOpenCookies} />
      <div>
        {/* ... */}
        <SpeedInsights />
      </div>
    </div>
  );
};
export default App;
