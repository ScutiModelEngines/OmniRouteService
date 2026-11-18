# OmniRouteService

OmniRoute is a self-hosted router that puts many LLM providers behind one OpenAI-compatible endpoint. The dashboard and API share LAN port `29651`. [Upstream OmniRoute](https://github.com/diegosouzapw/OmniRoute)

## Deploy

From Windows, run `run.bat` and choose **1 Deploy**, or run `run.bat deploy`. This copies the folder to `lex@scutiserver1.local:/media/ZimaOS-HD/Apps/ModelEngines/` for manual startup on the server. Deploy only from a folder with no local `.env` or `data/`, or it overwrites the server's copies.

## First run on the server

1. Open `/media/ZimaOS-HD/Apps/ModelEngines/OmniRouteService`. Copy `.env.example` to `.env` and restrict permissions with `chmod 600 .env`.
2. Leave `API_KEY_SECRET` empty to let OmniRoute generate one into `data/server.env`, or set it with the output of `openssl rand -hex 32`.
3. Run `docker compose up -d`, then open [http://scutiserver1.local:29651](http://scutiserver1.local:29651).

Back up `data/`, which holds SQLite and the stored provider keys. Keep a separate backup of `API_KEY_SECRET` once set.
