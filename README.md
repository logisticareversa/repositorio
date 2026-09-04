# Auditoria de Fretes + Supabase

Esta versão substitui as chamadas `/api/fretes` e `/api/manifestacao` do projeto original por acesso direto ao Supabase.

## Arquivos

- `index.html` — aplicação web.
- `schema.sql` — criação das tabelas, índices, RLS e histórico de manifestações.

## 1. Criar o projeto

Crie um projeto gratuito no Supabase:
https://supabase.com/

## 2. Criar o banco

No Supabase:

SQL Editor → New query

Cole todo o conteúdo de `schema.sql` e execute.

Serão criadas:

- `fretes`
- `manifestacoes`

## 3. Criar o primeiro usuário

No Supabase:

Authentication → Users → Add user

Crie um usuário com e-mail e senha.

O sistema foi configurado para exigir login.

## 4. Configurar o HTML

Abra `index.html` e procure:

const SUPABASE_URL = "https://divojbzqyavitbzyjxfi.supabase.co";
const SUPABASE_PUBLISHABLE_KEY = "sb_publishable_Mvcm2SEpyA7CfU3BXJr33w_tklCk9mS";

Substitua pelos dados do seu projeto.

Use a Publishable key (ou a antiga anon key). NÃO use `service_role`/secret key no HTML.

## 5. Inserir os fretes

Você pode usar:

Supabase → Table Editor → fretes → Import data

Para grandes volumes, CSV costuma ser mais conveniente.

Os nomes das colunas precisam corresponder ao schema.

## 6. Testar localmente

Não abra simplesmente o arquivo com `file://` se o navegador bloquear recursos.

Uma forma simples é usar o VS Code com Live Server.

Outra opção, se tiver Python instalado:

python -m http.server 8000

Depois abra:

http://localhost:8000/

## 7. Publicar no GitHub Pages

Crie um repositório no GitHub.

Coloque:

index.html
schema.sql
README.md

Depois:

Settings → Pages → Deploy from branch → main → /root

O GitHub Pages passará a servir o `index.html`.

## 8. Fluxo final

GitHub Pages
    ↓
index.html
    ↓
Supabase Auth
    ↓
Supabase Data API
    ↓
PostgreSQL

O navegador consulta:

fretes → SELECT

e salva:

fretes → UPDATE
manifestacoes → INSERT

## Segurança

A tabela está protegida por Row Level Security e somente usuários autenticados recebem acesso.

Não coloque uma chave `service_role` ou `secret` no frontend.

