export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Credentials', true);
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT');
  res.setHeader('Access-Control-Allow-Headers', 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version');

  if (req.method === 'OPTIONS') { res.status(200).end(); return; }
  if (req.method !== 'POST') { return res.status(405).json({ error: 'Method not allowed' }); }

  const apiKey = process.env.VITE_RESEND_API_KEY;
  try {
    const { name, email, phone, message } = req.body;
    const apiKey = process.env.VITE_RESEND_API_KEY;
    console.log("API Key letta dal server:", apiKey ? "Sì (Presente)" : "No (Mancante/Undefined)");
    if (!apiKey) return res.status(500).json({ error: 'API Key mancante' });

    const response = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Authorization': `Bearer ${apiKey}` },
      body: JSON.stringify({
        from: 'onboarding@resend.dev',
        to: 'info@prima-studio-agency.com',
        subject: `Lead: ${name}`,
        html: `<p>Nome: ${name}</p><p>Email: ${email}</p><p>Tel: ${phone}</p><p>${message}</p>`
      })
    });

    const data = await response.json();
    if (!response.ok) return res.status(response.status).json(data);
    return res.status(200).json(data);
  } catch (error) {
    return res.status(500).json({ error: 'Internal Error' });
  }
}
