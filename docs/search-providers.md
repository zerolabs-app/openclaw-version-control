# OpenClaw Search Providers

## Recommended for Most Users

During OpenClaw onboarding, choose:

**Parallel Search (Free)**

It's free, needs no API key and no account, and gives your agent good web search right away. The onboarding list has two Parallel lines - pick the one marked **(Free)**, not "Parallel Search", which needs a paid key.

You can change your search provider at any time:

```bash
openclaw onboard
```

---

# OpenClaw Search Philosophy

OpenClaw works best when it:

1. Searches first
2. Collects evidence
3. Analyzes second

If research quality is weak, try a different search provider before changing AI models.

---

# Free - No API Key Needed

## Parallel Search (Free) - recommended

https://parallel.ai/

* Free web search through Parallel's hosted service
* No API key or account
* Results are written for AI agents to read

## Codex Hosted Search

* Free for people who signed in with ChatGPT (Codex login)
* Uses your Codex account - only works with that sign-in

## Firecrawl Search (Free)

https://firecrawl.dev/

* Free starter tier, no API key
* Good at pulling content out of web pages

## DuckDuckGo Search (experimental)

https://duckduckgo.com/

* Free fallback with no API key
* Marked experimental in OpenClaw - fewer results than the options above

## Ollama Web Search

https://ollama.com/

* Needs Ollama installed and signed in on this computer

## SearXNG Search

https://docs.searxng.org/

* Free, open source meta-search
* Needs your own SearXNG server address

---

# Needs an API Key

These can give stronger results for heavy research. Most have a free tier or trial credits; usage charges may apply after that.

| Provider | Good for | Key from |
|---|---|---|
| Brave Search | General web results | https://brave.com/search/api/ |
| Tavily Search | Research, AI answer summaries | https://tavily.com/ |
| Exa Search | Research, date filters, content extraction | https://exa.ai/ |
| Firecrawl Search | Structured results with page scraping | https://firecrawl.dev/ |
| Parallel Search | Dense excerpts written for AI | https://parallel.ai/ |
| Perplexity Search | Structured results with citations | https://www.perplexity.ai/ (or an OpenRouter key) |
| Gemini (Google Search) | Google search grounding | https://aistudio.google.com/app/apikey |
| Grok (xAI) | Real-time web and social content | https://x.ai/ (xAI key or sign-in) |
| Kimi (Moonshot) | Moonshot web search | https://www.moonshot.ai/ |
| MiniMax Search | Structured results | MiniMax Token Plan key or sign-in |

---

# Important

Pricing, limits, availability and features change over time. Before entering an API key, check the provider's current pricing, usage limits and terms.

---

# Changing Search Providers Later

```bash
openclaw onboard
```

Choose a different search provider when onboarding reaches the **Search provider** screen. Rerunning onboarding is safe - it doesn't delete your workspace, jobs or results.

Mission Control users can also use **Tools → Add Search Provider**.
