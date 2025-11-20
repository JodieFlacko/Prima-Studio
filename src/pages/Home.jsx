import React from 'react';
import { Helmet } from 'react-helmet-async';
import Hero from '../components/Hero';
import Services from '../components/Services';
import ProjectsSection from '../components/ProjectsSection';
import ContactForm from '../components/ContactForm';
const Home = () => (
  <div className="animate-in fade-in duration-700">
    <Helmet><title>Prima Studio | Agenzia Web Design Premium</title><meta name="description" content="Trasformiamo aziende visionarie." /></Helmet>
    <Hero />
    <Services />
    <ProjectsSection />
    <ContactForm />
  </div>
);
export default Home;
