import React, { useState, useEffect, Suspense, lazy } from 'react';
import { Routes, Route, useLocation } from 'react-router-dom';
import { SpeedInsights } from '@vercel/speed-insights/react';
import CustomCursor from './components/CustomCursor';
import Navbar from './components/Navbar';
import Footer from './components/Footer';
import CookieBanner from './components/CookieBanner';
import { PRIVACY_CONTENT, TERMS_CONTENT, COOKIE_CONTENT } from './data/legalContent';

// Lazy Load
const Home = lazy(() => import('./pages/Home'));
const Works = lazy(() => import('./pages/Works'));
const Legal = lazy(() => import('./pages/Legal'));
const NotFound = lazy(() => import('./pages/NotFound'));

const ScrollToTop = () => {
  const { pathname } = useLocation();
  useEffect(() => { if (!pathname.includes('#')) window.scrollTo(0, 0); }, [pathname]);
  return null;
};

const PageLoader = () => (
  <div className="min-h-screen flex items-center justify-center bg-[#0a0a0a]">
    <div className="w-8 h-8 border-2 border-[#00D9FF] border-t-transparent rounded-full animate-spin" />
  </div>
);

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
        <Suspense fallback={<PageLoader />}>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/works" element={<Works />} />
            <Route path="/privacy" element={<Legal title="Privacy Policy" content={PRIVACY_CONTENT} />} />
            <Route path="/terms" element={<Legal title="Termini e Condizioni" content={TERMS_CONTENT} />} />
            <Route path="/cookie" element={<Legal title="Cookie Policy" content={COOKIE_CONTENT} />} />
            <Route path="*" element={<NotFound />} />
          </Routes>
        </Suspense>
      </main>
      <Footer setOpenCookies={setOpenCookies} />
      <CookieBanner openPreferences={openCookies} setOpenPreferences={setOpenCookies} />
      <SpeedInsights />
    </div>
  );
};
export default App;
