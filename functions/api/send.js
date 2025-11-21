export async function onRequestPost(context) {
  try {
    const { request, env } = context;
    const body = await request.json();

    // Verifica che la chiave esista
    if (!env.RESEND_API_KEY) {
      return new Response(JSON.stringify({ error: "Manca la API Key su Cloudflare" }), {
        status: 500,
        headers: { "Content-Type": "application/json" }
      });
    }

    const resendResponse = await fetch("https://api.resend.com/emails", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${env.RESEND_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        from: "onboarding@resend.dev", // O il tuo dominio verificato
        to: "info@prima-studio-agency.com",
        subject: `Lead dal sito: ${body.name}`,
        html: `
          <h3>Nuovo contatto</h3>
          <p><strong>Nome:</strong> ${body.name}</p>
          <p><strong>Email:</strong> ${body.email}</p>
          <p><strong>Tel:</strong> ${body.phone}</p>
          <hr/>
          <p>${body.message}</p>
        `,
      }),
    });

    const data = await resendResponse.json();

    if (!resendResponse.ok) {
      return new Response(JSON.stringify(data), { status: 500, headers: { "Content-Type": "application/json" } });
    }

    return new Response(JSON.stringify({ success: true }), {
      status: 200,
      headers: { "Content-Type": "application/json" }
    });

  } catch (err) {
    return new Response(JSON.stringify({ error: err.message }), { status: 500 });
  }
}