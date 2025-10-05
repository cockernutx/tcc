#import "template.typ": *

// Document content
#show: udf-paper.with(
  title: "Desenvolvimento de um Sistema de Gerenciamento de Conteúdo Headless",
  subtitle: "Uma Abordagem Moderna para CMS",
  authors: (
    (name: "Gustavo Medeiros Lima", student-id: "31466281"),
  ),
  course: "Ciência da Computação",
  advisor: "",
  city: "Brasília",
  year: 2024,
  bibliography: bibliography("refs.yml", style: "associacao-brasileira-de-normas-tecnicas.csl")
)

// ===========================================
// CAPÍTULO 1 - DEFINIÇÃO DO PROBLEMA, OBJETIVOS E METODOLOGIA
// ===========================================

= Introdução

== Definição do Problema

Criar websites interativos com backend representa um dos maiores desafios no desenvolvimento web moderno, exigindo domínio de múltiplas tecnologias e arquiteturas complexas. Desenvolvedores precisam gerenciar simultaneamente a experiência do usuário no frontend - com JavaScript, frameworks reativos, estados de aplicação e responsividade - enquanto constroem uma infraestrutura robusta no backend que inclui APIs, bancos de dados, autenticação, autorização e segurança. 

A integração entre essas camadas adiciona complexidade significativa, especialmente quando se considera aspectos como performance, escalabilidade, acessibilidade e compatibilidade entre dispositivos. Além disso, a necessidade de sincronização de dados em tempo real, gerenciamento de sessões, otimização de consultas ao banco de dados e implementação de medidas de segurança contra vulnerabilidades como CSRF, XSS e injeção SQL torna o processo ainda mais desafiador, exigindo conhecimento profundo tanto de conceitos técnicos quanto de boas práticas de desenvolvimento.

== Objetivos

=== Objetivo Geral

Desenvolver um sistema de gerenciamento de conteúdo headless (CMS Headless) que permita a criação, edição e distribuição de conteúdo de forma desacoplada, oferecendo flexibilidade para desenvolvedores criarem interfaces personalizadas enquanto mantém a facilidade de uso para editores de conteúdo, demonstrando na prática as vantagens arquiteturais desta abordagem moderna em comparação aos CMS tradicionais.

=== Objetivos Específicos

1. Implementar uma arquitetura de banco de dados PostgreSQL que suporte a natureza dinâmica das coleções de conteúdo
2. Desenvolver um sistema de autenticação utilizando tokens JWT com criptografia RSA
3. Criar uma interface administrativa em SolidJS para gerenciamento de conteúdo
4. Implementar APIs REST e GraphQL para consumo flexível do conteúdo
5. Desenvolver um sistema de gerenciamento de assets para mídias
6. Implementar controle de acesso granular até o nível de campos individuais
7. Demonstrar a flexibilidade da arquitetura headless através de casos de uso práticos

== Metodologia

O CMS Headless será desenvolvido com uma arquitetura centrada na flexibilidade de criação e gerenciamento de conteúdo. O sistema permitirá aos usuários definir suas próprias coleções de dados de forma dinâmica através de um dashboard administrativo, onde cada coleção poderá ter campos e tipos de dados customizados conforme a necessidade específica do projeto, eliminando a rigidez dos CMS tradicionais baseados em templates fixos.

O sistema de autenticação utilizará tokens JWT com criptografia RSA, garantindo segurança na comunicação e controle de acesso granular aos recursos do CMS. Os usuários autenticados poderão criar, editar e gerenciar suas coleções através de uma interface que será construída em SolidJS, oferecendo uma experiência reativa e moderna para administração de conteúdo.

A arquitetura do banco de dados PostgreSQL será projetada para suportar a natureza dinâmica das coleções, permitindo que o sistema armazene diferentes tipos de conteúdo sem necessidade de modificações estruturais no esquema do banco. O sistema também incorporará um serviço dedicado para gerenciamento de assets, facilitando o upload e organização de mídias associadas ao conteúdo.

A camada de consultas oferecerá APIs que permitirão aos desenvolvedores frontend consumir o conteúdo de forma flexível, seja através de consultas REST ou GraphQL, proporcionando total liberdade na apresentação dos dados em qualquer tecnologia ou plataforma. Esta abordagem demonstrará como um CMS Headless pode oferecer máxima flexibilidade tanto para criadores de conteúdo quanto para desenvolvedores.

// ================================
// CAPÍTULO 2 - REFERENCIAL TEÓRICO
// ================================

= Referencial Teórico

Este capítulo apresenta o referencial teórico fundamental para compreensão dos conceitos, tecnologias e metodologias empregadas no desenvolvimento do sistema proposto, abrangendo desde fundamentos de CMS tradicionais até arquiteturas headless modernas e sistemas avançados de controle de acesso.

== Sistemas de Gerenciamento de Conteúdo (CMS)

=== Conceitos Fundamentais

Os Sistemas de Gerenciamento de Conteúdo (Content Management Systems - CMS) representam uma categoria fundamental de aplicações web que facilitam a criação, edição, organização e publicação de conteúdo digital. Segundo @ferraiolo2004lightweight, um CMS eficiente deve proporcionar "uma arquitetura extensível loose-coupled que cubra os principais requisitos de um sistema comum de gerenciamento de conteúdo".

A evolução dos CMS pode ser compreendida através de três gerações distintas. A primeira geração, caracterizada por sites estáticos, exigia conhecimento técnico especializado para qualquer modificação de conteúdo. A segunda geração introduziu os CMS tradicionais monolíticos, como WordPress e Joomla, que democratizaram a publicação web através de interfaces administrativas intuitivas. A terceira geração atual é marcada pela emergência de arquiteturas headless e API-first, que separam completamente a gestão de conteúdo de sua apresentação.

Os componentes principais de um CMS moderno incluem:

1. Interface administrativa para criação e edição de conteúdo
2. Sistema de armazenamento e organização de dados  
3. Mecanismo de entrega de conteúdo
4. Sistema de controle de acesso e permissões
5. APIs para integração com sistemas externos

=== Tipos de CMS e Arquiteturas

A taxonomia atual de CMS pode ser classificada em três categorias principais, cada uma com características arquiteturais distintas.

*CMS Tradicionais (Monolíticos)*: Caracterizam-se pelo acoplamento estreito entre backend e frontend. WordPress, que alimenta mais de 40% dos websites globais @w3techs2024usage, exemplifica essa abordagem. Estes sistemas oferecem facilidade de uso e deployment, mas apresentam limitações significativas em flexibilidade e escalabilidade.

*CMS Headless (Desacoplados)*: Representam uma mudança paradigmática na arquitetura de gerenciamento de conteúdo. Conforme demonstrado no estudo comparativo de @zhang2008content, que analisou 29 características em 13 CMS open source, a separação entre camadas de conteúdo e apresentação oferece vantagens substanciais em performance e flexibilidade tecnológica.

*CMS Híbridos*: Combinam funcionalidades de ambas as abordagens, permitindo tanto o uso tradicional quanto headless conforme a necessidade do projeto.

== Controle de Acesso: Evolução de RBAC para ABAC

=== Limitações do Role-Based Access Control (RBAC)

O Role-Based Access Control (RBAC), estabelecido por @sandhu1996role e formalizado como padrão NIST INCITS 359-2004 @ferraiolo2003role, representou um avanço significativo sobre modelos de controle de acesso discricionário e obrigatório. Conforme demonstrado por @barkley1999role em sua implementação de referência para intranets corporativas, RBAC oferece "administradores meios de gerenciar dados de autorização em nível empresarial".

No entanto, RBAC apresenta limitações fundamentais que se tornam problemáticas em sistemas modernos de gerenciamento de conteúdo:

*Role Explosion*: Em organizações grandes, a necessidade de direitos de acesso únicos para diferentes usuários resulta na criação de múltiplos papéis, aumentando exponencialmente a complexidade de gerenciamento.

*Rigidez Contextual*: RBAC não consegue modelar políticas baseadas em contexto dinâmico como tempo, localização, postura de segurança do dispositivo ou relacionamentos temporários entre usuários e recursos.

*Granularidade Limitada*: Embora o projeto atual implemente permissões field-level sobre RBAC, esta extensão representa uma solução ad-hoc que não resolve as limitações fundamentais do modelo.

=== Attribute-Based Access Control (ABAC): Definição e Fundamentos

Attribute-Based Access Control (ABAC) representa uma evolução paradigmática dos modelos tradicionais de controle de acesso. Conforme definido no *NIST SP 800-162* @nist2014abac, ABAC é "um modelo de controle de acesso lógico que controla o acesso a objetos através de políticas que avaliam atributos associados ao sujeito, objeto, operação solicitada e, em alguns casos, condições ambientais".

A arquitetura ABAC fundamenta-se em quatro dimensões principais, seguindo os componentes arquiteturais estabelecidos por @jin2012abac:

1. *Atributos do Sujeito*: Características do usuário (ID, função, departamento, nível de autorização, tempo de serviço)
2. *Atributos do Objeto*: Propriedades do recurso (tipo, proprietário, classificação de segurança, data de criação)
3. *Atributos da Ação*: Operações específicas sendo solicitadas (leitura, escrita, execução, publicação)
4. *Atributos Ambientais*: Contexto da solicitação (tempo, localização, dispositivo, postura de segurança)

=== Modelo ABACα e Fundamentos Matemáticos

O modelo ABACα desenvolvido por @jin2012abac unifica DAC, MAC e RBAC através de definições formais baseadas em lógica de predicados. Este modelo estabelece as especificações funcionais e semânticas que fundamentam implementações modernas de ABAC.

Conforme formalizado por @jin2012abac, uma política ABAC avalia um conjunto de atributos do sujeito, objeto, ambiente e ação para produzir uma decisão de autorização (permit ou deny). Esta formalização matemática permite verificação formal de propriedades de segurança e análise de conflitos entre políticas.

=== Superioridade Técnica do ABAC para CMS Headless

A pesquisa acadêmica recente demonstra vantagens significativas do ABAC sobre RBAC para sistemas modernos. @servos2017abac estabeleceram framework conceitual que classifica modelos ABAC por expressividade e complexidade computacional, identificando ABAC como solução superior para cenários que requerem:

*Expressividade Superior*: ABAC permite políticas expressas em linguagem natural como "Médicos podem acessar registros de pacientes em seu departamento durante horário de trabalho em dispositivo aprovado" - regra impossível de expressar eficientemente em RBAC puro.

*Flexibilidade Dinâmica*: Decisões de acesso podem mudar entre solicitações alterando apenas valores de atributos, sem modificar relacionamentos sujeito/objeto subjacentes.

*Granularidade Data-Centric*: Controle aplicado diretamente aos elementos de dados, essencial para sistemas CMS onde diferentes campos podem ter requisitos de segurança distintos.

*Adaptabilidade Contextual*: Suporte nativo para condições ambientais e temporais, crucial para sistemas que operam em múltiplos contextos organizacionais e geográficos.

=== Arquitetura de Componentes ABAC

A arquitetura ABAC segue especificações do NIST SP 800-162 com quatro componentes principais:

*Policy Decision Point (PDP)*: Avalia políticas e retorna decisões Permit/Deny. Implementável centralizada ou distribuídamente, conforme demonstrado por @bhatt2020abac em ambientes cloud-IoT.

*Policy Enforcement Point (PEP)*: Intercepta requisições em APIs, microserviços ou gateways, aplicando decisões do PDP. Para sistemas CMS headless, o PEP é tipicamente implementado como middleware nas APIs de entrega de conteúdo.

*Policy Information Point (PIP)*: Conecta-se a fontes externas como LDAP, bases de dados e APIs para fornecer atributos necessários para avaliação de políticas.

*Policy Administration Point (PAP)*: Gerencia criação, teste e deployment de políticas através de UIs administrativas ou Policy-as-Code.

=== Implementações Avançadas e Tendências Recentes

Pesquisas recentes exploram extensões avançadas do modelo básico ABAC:

*ABAC-CC (Attribute-Based Communication Control)*: Desenvolvido por @bhatt2020abac para IoT habilitado por cloud, incorpora atributos de mensagem para controle de fluxo de dados em aplicações Smart Health.

*Machine Learning para Automação ABAC*: O modelo ALBERT-PFN @xu2024abac usa deep learning para mineração de atributos ABAC, alcançando precisão de 88.13% no reconhecimento de entidades e F1-score de 89.93% na extração de relacionamentos.

*Blockchain-enabled ABAC*: @chen2025blockchain implementa PDP descentralizado usando blockchain para ambientes distribuídos, oferecendo paradigma de execução de redundância mínima com otimizações para performance.

*Zero-Trust Integration*: @liu2022zero demonstra integração de ABAC com arquiteturas Zero-Trust, onde atributos dinâmicos de postura de segurança são continuamente avaliados.

=== ABAC no Contexto de CMS: Casos de Uso e Benefícios

Para sistemas de gerenciamento de conteúdo, ABAC oferece vantagens específicas documentadas na literatura:

*Controle Temporal de Publicação*: Políticas como "Artigos podem ser publicados apenas durante horário comercial por editores senior" são nativamente expressáveis em ABAC.

*Segmentação de Audiência*: Controle baseado em atributos de perfil permite entrega personalizada de conteúdo sem modificação estrutural do sistema.

*Colaboração Baseada em Projeto*: Atributos de associação a projetos permitem acesso dinâmico a recursos sem criação de roles específicos.

*Compliance Automatizado*: Políticas regulatórias (GDPR, HIPAA) podem ser expressas diretamente em termos de atributos de dados e usuários.

== Arquitetura Headless e API-First

=== Fundamentos da Arquitetura Headless

A arquitetura headless representa uma evolução natural dos princípios estabelecidos por @fielding2000architectural em sua definição do estilo arquitetural REST. Esta abordagem fundamenta-se na separação total entre a camada de conteúdo (backend) e a camada de apresentação (frontend), conectadas exclusivamente através de APIs bem definidas.

O conceito de "API-first" prioriza o desenvolvimento de interfaces de programação robustas e bem documentadas como base do sistema. @chen2002study descreveram este padrão em seu modelo arquitetural para aplicações web orientadas a conteúdo, identificando componentes independentes que "realizam funções necessárias de organização, processamento e apresentação de conteúdo".

Content as a Service (CaaS) emerge como paradigma central, onde o conteúdo é tratado como um serviço distribuído, acessível através de APIs padronizadas. Esta abordagem permite a implementação de estratégias omnichannel, onde o mesmo conteúdo pode ser consumido por múltiplas aplicações cliente (web, mobile, IoT, etc.).

=== Vantagens e Desafios da Abordagem Headless

As vantagens da arquitetura headless são substanciais e bem documentadas na literatura. A flexibilidade tecnológica permite que equipes de desenvolvimento escolham as melhores ferramentas para cada camada, sem restrições impostas pela tecnologia do CMS. A escalabilidade independente possibilita que backend e frontend sejam otimizados e escalados separadamente, conforme suas demandas específicas.

A reutilização de conteúdo constitui uma vantagem estratégica significativa. Uma única API pode servir simultaneamente aplicações web, mobile, dispositivos IoT e sistemas de terceiros, maximizando o retorno sobre o investimento em criação de conteúdo.

No entanto, a complexidade inicial representa um desafio considerável. O setup de um sistema headless requer conhecimento técnico mais elevado e coordenação cuidadosa entre equipes de backend e frontend. A gestão de estado e sincronização entre múltiplas aplicações cliente adiciona complexidade arquitetural que deve ser cuidadosamente planejada.

== GraphQL: Linguagem de Consulta para APIs Modernas

=== Fundamentos e Evolução do GraphQL

GraphQL representa uma evolução significativa no design de APIs, oferecendo uma alternativa robusta aos padrões REST tradicionais. Conforme documentado por @brito2022graphql em seu estudo sistemático que analisou 135 estudos primários sobre GraphQL, esta tecnologia tem ganhado adoção crescente desde seu lançamento em 2015, com publicações científicas aumentando consistentemente até 2021.

O sistema de tipos forte do GraphQL constitui um de seus pilares fundamentais. Cada API GraphQL define um esquema que serve como contrato entre cliente e servidor, especificando exatamente quais operações são possíveis e que tipos de dados podem ser retornados. Este esquema autodocumentado facilita o desenvolvimento e manutenção de aplicações complexas.

@hartig2018semantics formalizaram a semântica e complexidade computacional do GraphQL, demonstrando que "GraphQL permite que clientes recuperem dados de interesse de forma flexível e eficiente" através de uma única endpoint. Esta característica contrasta com APIs REST, que frequentemente requerem múltiplas requisições para obter dados relacionados.

=== Implementação GraphQL no Contexto de CMS

A aplicação de GraphQL em sistemas de gerenciamento de conteúdo oferece vantagens particulares para a flexibilidade de consultas. No projeto proposto, o esquema GraphQL implementa tipos específicos para Collection, Entry, Field e FieldValue, proporcionando uma interface unificada para diferentes tipos de dados.

O sistema de Union Types permite que FieldValue represente diferentes tipos de dados (Text, Asset, BooleanValue, NumberValue, DateTime, RichText, Json) de forma type-safe. Esta abordagem elimina a necessidade de múltiplas endpoints específicas para cada tipo de campo, simplificando a arquitetura da API.

O sistema de filtering implementado permite consultas dinâmicas baseadas no tipo de campo. Por exemplo, campos de texto suportam operações como `contains`, `startsWith` e `endsWith`, enquanto campos numéricos oferecem comparações matemáticas como `gt`, `gte`, `lt` e `lte`. @bax2020mechanized demonstraram através de formalização mecanizada que tais sistemas de filtragem podem ser validados estaticamente, garantindo correção das consultas.

=== Resolvers e Otimização de Performance

A implementação de resolvers eficientes constitui aspecto crítico para performance de APIs GraphQL. No contexto de CMS com esquemas dinâmicos, os resolvers devem ser capazes de consultar diferentes tabelas baseando-se no tipo de campo solicitado.

A estratégia implementada utiliza consultas SQL otimizadas que aplicam filtros diretamente no nível do banco de dados, evitando over-fetching de dados. Para consultas que envolvem múltiplos campos com filtros, o sistema implementa EXISTS subqueries que garantem que apenas entradas que satisfazem todos os critérios sejam retornadas.

== Modelagem de Dados Dinâmica e Flexível

=== Desafios da Modelagem Dinâmica

A modelagem de dados para CMS que permitem definição dinâmica de tipos de conteúdo apresenta desafios únicos na engenharia de software. Segundo @kleppmann2017designing, sistemas que necessitam de flexibilidade de esquema devem balancear cuidadosamente entre performance de consultas e adaptabilidade estrutural.

O padrão Entity-Attribute-Value (EAV) tradicionalmente usado para esquemas dinâmicos apresenta limitações significativas em performance e complexidade de consultas. Para endereçar estas limitações, o sistema proposto implementa uma abordagem híbrida que combina tabelas tipadas para tipos de dados primitivos com armazenamento JSON para estruturas complexas.

=== Estratégia de Armazenamento Híbrida

A arquitetura de dados implementa estratégias diferenciadas baseadas na natureza dos tipos de dados:

*Tipos Primitivos*: Text, boolean, number e date_time são armazenados em tabelas dedicadas (entry_texts, entry_booleans, entry_numbers, entry_datetimes). Esta abordagem permite indexação eficiente e consultas otimizadas para operações comuns como busca textual e comparações numéricas.

*Tipos Complexos*: Object, text_list, number_list e json são armazenados na tabela unificada entry_json_data, aproveitando as capacidades nativas do PostgreSQL para dados semi-estruturados. O campo value_type permite distinguir entre diferentes estruturas JSON, mantendo type safety a nível de aplicação.

*Tipos Especiais*: Assets utilizam tabela de referência (entry_assets) para metadados de arquivos, enquanto rich_text implementa armazenamento dual (raw + rendered) para otimização de performance de renderização.

*Relacionamentos*: A tabela entry_relations gerencia referências entre entradas, suportando relacionamentos um-para-um, um-para-muitos e muitos-para-muitos através de configuração de campo.

== Frameworks e Padrões para Implementação de ABAC

=== Open Policy Agent (OPA) e Linguagem Rego

Open Policy Agent emergiu como padrão de facto para implementação de ABAC em sistemas modernos. Conforme documentado por @styra2024opa, OPA oferece policy engine de propósito geral com linguagem declarativa Rego, arquitetura desacoplada Policy-as-Code e performance otimizada para milhares de autorizações por segundo.

A linguagem Rego permite expressão de políticas complexas de forma declarativa:

```rego
allow {
  is_editor
  has_department_access
  within_business_hours
}

is_editor {
  input.user.role == "editor"
}

has_department_access {
  input.user.department == input.resource.department
}

within_business_hours {
  9 <= time.clock(time.now_ns())[0] < 17
}
```

=== XACML (eXtensible Access Control Markup Language)

XACML permanece como padrão OASIS principal para linguagem de políticas ABAC. Conforme especificado por @oasis2013xacml, XACML define arquitetura, protocolo request/response e 13 algoritmos de combinação para resolução de conflitos entre políticas.

A estrutura hierárquica do XACML inclui:
- *Rules*: Unidade básica de política com condição e efeito
- *Policies*: Conjunto de rules com algoritmo de combinação
- *PolicySets*: Container para policies com meta-políticas

Algoritmos de combinação como `deny-overrides` e `permit-overrides` resolvem conflitos sistematicamente, essencial para implementações robustas em sistemas enterprise.

=== Frameworks Modernos para Web

*Casbin*: Biblioteca multi-linguagem que oferece ABAC simplificado usando structs/objetos, popular para implementações em Node.js e Python @casbin2024docs.

*AWS IAM com Tags*: Implementa ABAC nativamente usando tags como atributos, demonstrando escalabilidade enterprise em ambientes cloud @aws2024abac.

*Apache Ranger*: Framework abrangente para segurança de dados com suporte nativo para tag-based ABAC policies e integração com Apache Atlas @ranger2024docs.

== Segurança e Performance em Sistemas ABAC

=== Vulnerabilidades Específicas do ABAC

A literatura identifica vulnerabilidades específicas do ABAC que exigem mitigação cuidadosa:

*Attribute Poisoning*: Atacantes manipulam atributos de entrada para obter acesso não autorizado. @avatier2024security demonstra mitigação através de verificação criptográfica de asserções e validação em tempo real.

*Inference Attacks*: Exploração de padrões comportamentais para inferir regras de políticas. Defendido por limitação da visibilidade de regras aplicáveis e obfuscação de decisões.

*Policy Conflicts*: Múltiplas políticas podem produzir decisões conflitantes. @oasis2013xacml especifica algoritmos formais para resolução, enquanto @combiningpolicies2009 analisa teoria e prática de combinação de políticas.

=== Otimizações de Performance

Benchmarks de performance mostram engines XACML modernos avaliando 10.000 requests em ~10 milissegundos @performance2024abac. Técnicas de otimização incluem:

*Smart Mask Ordering*: Reordenação de avaliação de atributos por probabilidade de decisão, resultando em 89% de melhoria de performance.

*Attribute Caching*: Cache distribuído de atributos frequentemente acessados, reduzindo latência de PIPs externos.

*Policy Indexing*: Estruturas de dados otimizadas para busca rápida de políticas aplicáveis baseada em atributos de contexto.

== Trabalhos Correlatos e Análise Comparativa

=== CMS Tradicionais: WordPress e Joomla

WordPress domina o mercado de CMS com mais de 40% de participação global @w3techs2024usage, representando o paradigma monolítico tradicional. Sua arquitetura PHP/MySQL com sistema extenso de plugins oferece flexibilidade significativa dentro dos limites de sua estrutura acoplada.

As limitações arquiteturais do WordPress tornam-se evidentes em cenários de alto tráfego e necessidades de integração API-first. O sistema de hooks e filters, embora poderoso, não foi projetado para arquiteturas headless, resultando em performance subótima quando usado exclusivamente como backend.

Joomla posiciona-se como alternativa intermediária, oferecendo gestão mais robusta de usuários e permissões comparado ao WordPress, mas mantendo limitações similares de acoplamento arquitetural. Seu sistema de ACL (Access Control List) inspira aspectos do design de permissões do projeto proposto, embora sem a granularidade field-level implementada.

=== Soluções Headless Existentes: Strapi como Referência

Strapi emerge como principal referência para CMS headless open-source, compartilhando várias características com o projeto proposto. Ambos sistemas implementam:

- Collections dinâmicas definíveis via interface administrativa
- APIs GraphQL e REST
- Sistemas de permissões baseados em roles
- Suporte a múltiplos tipos de dados

As diferenças arquiteturais significativas incluem:

*Granularidade de Permissões*: Strapi implementa apenas RBAC básico, limitando-se a permissões em nível de collection e ação, enquanto o sistema proposto avança para ABAC com permissões field-specific.

*Flexibilidade de Schema*: A modelagem híbrida proposta oferece maior otimização para diferentes tipos de dados comparada à abordagem uniforme do Strapi.

*Controle de Acesso Contextual*: Strapi não suporta políticas baseadas em contexto ambiental, limitação resolvida pela implementação ABAC proposta.

=== Sistemas ABAC em Produção

*2U - Plataforma de Educação*: Implementou GraphQL-native ABAC com Hygraph, alcançando escalabilidade para múltiplas universidades parceiras @2u2024case. A implementação demonstra viabilidade de ABAC em ambientes educacionais complexos.

*Adobe Experience Manager*: Implementa controle baseado em metadados de assets com regras por grupo, região e marca @adobe2024abac, aplicando automaticamente baseado em classificação de conteúdo.

*Netflix*: Utiliza OPA extensivamente para decisões de autorização em arquitetura de microserviços @netflix2024opa, demonstrando escalabilidade de ABAC em sistemas de alta performance.

=== Gaps Identificados no Mercado

A análise comparativa revela lacunas no mercado atual de CMS headless:

*ABAC Nativo*: A implementação de controle de acesso baseado em atributos é rara em CMS headless, representando oportunidade para organizações com requisitos complexos de segurança.

*Performance Otimizada para ABAC*: A estratégia híbrida de armazenamento oferece vantagens de performance para avaliação de políticas comparada a implementações EAV tradicionais.

*Integração Zero-Trust*: Capacidade de avaliar postura de segurança e contexto dinâmico como parte das políticas de acesso representa diferencial competitivo significativo.

== Frameworks Reativos Modernos

=== Arquiteturas de Reatividade

Os frameworks reativos modernos representam uma evolução significativa no desenvolvimento de interfaces de usuário, oferecendo diferentes abordagens para gerenciamento de estado e atualização de interfaces. Frameworks como React, SolidJS e Vue implementam paradigmas de reatividade que variam entre Virtual DOM e fine-grained reactivity.

Conforme documentado por @solidjs2024docs, frameworks como SolidJS utilizam "compilation-time optimizations para criar updates granulares que atingem apenas os nós DOM específicos que necessitam mudança", eliminando a necessidade de reconciliação completa de árvores de componentes.

=== Vantagens para Aplicações Administrativas

Para aplicações de gerenciamento de conteúdo, as características dos frameworks reativos modernos oferecem vantagens específicas:

*Bundle Size Otimizado*: Frameworks como SolidJS oferecem runtime menor comparado a alternativas tradicionais, beneficiando dashboards administrativos que frequentemente incluem múltiplas bibliotecas especializadas.

*Performance Consistente*: A abordagem fine-grained reactivity oferece atualizações mais eficientes para interfaces que manipulam grandes volumes de dados, como listas de entradas de conteúdo ou árvores de categorias.

*Developer Experience*: A sintaxe baseada em JSX, comum a frameworks modernos, reduz a curva de aprendizado para desenvolvedores, facilitando migração e onboarding de equipes.

// ================================
// CAPÍTULO 3 - CONCEITO E DESIGN DO SISTEMA
// ================================

= Conceito e Design do Sistema

Este capítulo apresenta a concepção técnica e o design arquitetural do sistema CMS Headless, detalhando as tecnologias selecionadas, a estrutura do sistema e como os principais componentes se integram para atender aos requisitos estabelecidos. A arquitetura fundamenta-se nos princípios de separação de responsabilidades, escalabilidade e flexibilidade, elementos essenciais para um sistema de gerenciamento de conteúdo moderno.

== Arquitetura Geral do Sistema

=== Visão Arquitetural

O sistema CMS Headless é projetado seguindo uma arquitetura de microserviços desacoplada, onde cada componente possui responsabilidades bem definidas e comunica-se através de APIs padronizadas. A arquitetura fundamenta-se na separação clara entre três camadas principais, conforme ilustrado na Figura 3.1.

#figure(
  image("diagramas/Diagrama do sistema.png", width: 100%),
  caption: [Diagrama arquitetural do sistema CMS Headless mostrando a separação entre camadas e fluxo de comunicação]
) <fig-system-diagram>

*Camada de Dados (Data Layer)*: Responsável pelo armazenamento persistente e gerenciamento de dados, utilizando PostgreSQL como sistema de gerenciamento de banco de dados principal e Redis para cache de sessões e avaliações ABAC. Esta camada garante a integridade, consistência e persistência de todos os dados do sistema.

*Camada de API (API Layer)*: Atua como intermediária entre a camada de dados e as aplicações cliente, oferecendo interfaces REST (para casos específicos) e GraphQL (interface principal) para acesso aos dados. Esta camada implementa a lógica de negócio, autenticação, autorização e controle de acesso granular baseado em atributos (ABAC).

*Camada de Apresentação (Presentation Layer)*: Composta pelo dashboard administrativo desenvolvido em SolidJS, oferecendo uma interface reativa moderna para criação e gerenciamento de conteúdo. O website do usuário pode acessar a API diretamente ou utilizar uma biblioteca de acesso.

=== Princípios Arquiteturais

A arquitetura do sistema baseia-se em princípios fundamentais da engenharia de software moderna:

*Separação de Responsabilidades*: Cada componente possui uma função específica e bem definida, facilitando manutenção e evolução do sistema.

*Desacoplamento*: A comunicação entre componentes ocorre exclusivamente através de interfaces bem definidas (APIs), permitindo evolução independente de cada parte.

*Escalabilidade*: A arquitetura permite escalar diferentes componentes conforme a demanda, otimizando recursos e performance.

*Flexibilidade*: O design permite diferentes tecnologias frontend consumirem o mesmo backend, oferecendo liberdade de escolha para desenvolvedores.

== Tecnologias Utilizadas

=== Justificativa das Escolhas Tecnológicas

A seleção das tecnologias baseou-se em critérios de performance, maturidade, comunidade ativa e adequação aos requisitos do projeto.

*Node.js com TypeScript*: Escolhido para o backend pela sua performance em operações I/O intensivas, ecossistema robusto de bibliotecas e a vantagem da tipagem estática do TypeScript, que reduz erros em tempo de execução e melhora a manutenibilidade do código.

*PostgreSQL*: Selecionado como sistema de gerenciamento de banco de dados pela sua robustez, suporte nativo a JSON para dados semi-estruturados, capacidades avançadas de indexação e conformidade com padrões ACID. Sua flexibilidade é essencial para suportar a natureza dinâmica das coleções de conteúdo.

*Redis*: Utilizado como camada de cache para sessões de usuário, avaliações ABAC e otimização de performance, oferecendo TTL configurável e operações atômicas para garantir consistência.

*Drizzle ORM*: Utilizado como Object-Relational Mapping pela sua abordagem type-safe, performance otimizada e API intuitiva que mantém proximidade com SQL nativo, facilitando consultas complexas.

*SolidJS*: Selecionado para o frontend administrativo pela sua arquitetura de reatividade fine-grained, bundle size reduzido e performance superior comparada a frameworks tradicionais baseados em Virtual DOM.

*GraphQL*: Escolhido como interface principal pela capacidade de consultas flexíveis, type safety e possibilidade de geração de esquemas que facilitem o uso do sistema.

=== Integrações e Protocolos

*Autenticação JWT com RSA*: Sistema de tokens JWT (JSON Web Tokens) com criptografia assimétrica RSA para garantir segurança na comunicação e permitir verificação distribuída de autenticidade.

*Sistema de Sessões Redis*: Gerenciamento de sessões utilizando Redis como backend, oferecendo TTL configurável, extensão automática de sessões e cache de políticas ABAC para performance otimizada.

*HTTPS/TLS*: Comunicação segura obrigatória em todas as interfaces do sistema, garantindo confidencialidade e integridade dos dados em trânsito.


== Modelagem do Banco de Dados

=== Estratégia de Modelagem Dinâmica

O principal desafio na concepção do banco de dados é criar uma estrutura que suporte a definição dinâmica de tipos de conteúdo sem comprometer performance ou flexibilidade. A solução proposta utiliza uma abordagem híbrida que combina tabelas especializadas para tipos primitivos com armazenamento JSON para estruturas complexas.

=== Entidades Principais

*Collections (Coleções)*: Representa os tipos de conteúdo definidos pelos usuários. Cada coleção possui:
- Metadados básicos (nome, slug, descrição)
- Configurações visuais (ícone, cor)
- Suporte à internacionalização (locales suportados)
- Controle de criação e modificação

*Fields (Campos)*: Define os campos específicos de cada coleção com:
- Tipo de dados (enum com 12 tipos suportados)
- Validações (obrigatório, único)
- Metadados de apresentação (label, descrição)
- Configurações de segurança (sensibilidade, PII, criptografia)

*Entries (Entradas)*: Representa instâncias de conteúdo com:
- Status de publicação (DRAFT, PUBLISHED, ARCHIVED, DELETED)
- Controle de versioning e internacionalização
- Metadados de criação e modificação
- Sistema de slugs para URLs amigáveis

=== Estratégia de Armazenamento por Tipo

O sistema implementa diferentes estratégias de armazenamento baseadas na natureza dos tipos de dados:
#linebreak()
*Tipos Primitivos* (text, boolean, number, date_time):
Armazenados em tabelas dedicadas (`entry_texts`, `entry_booleans`, `entry_numbers`, `entry_datetimes`) para permitir indexação eficiente e consultas otimizadas. Esta abordagem garante performance superior para operações de busca e filtragem.
#linebreak()
*Tipo Typst* (typst_text):
Armazenado em tabela especializada (`entry_typst_texts`) que mantém tanto o código Typst original (`raw`) quanto a versão renderizada (`rendered`), permitindo edição e visualização eficientes do conteúdo tipográfico.
#linebreak()
*Tipos Complexos* (text_list, number_list, json):
Armazenados na tabela unificada `entry_json_data`, aproveitando as capacidades nativas do PostgreSQL para dados semi-estruturados. O campo `value_type` distingue entre diferentes estruturas JSON mantendo type safety a nível de aplicação.
#linebreak()
*Rich Text*:
Tabela `entry_rich_texts` com armazenamento triplo (raw + rendered + format) suportando múltiplos formatos (markdown, html, prosemirror) com sistema de renderização.
#linebreak()
*Assets*:
Sistema de assets com tabela `entry_assets` incluindo ordenação múltipla, metadados de acessibilidade (alt text, caption) e integração com upload de arquivos.
#linebreak()
*Relacionamentos*:
Sistema `entry_relations` gerenciando relacionamentos entre entradas com suporte a consultas GraphQL de relacionamentos aninhados.

=== Diagrama Entidade-Relacionamento

O diagrama ER apresentado na Figura 3.2 demonstra as principais entidades e seus relacionamentos:

#figure(
  image("diagramas/schema_database.png", width: 100%),
  caption: [Esquema completo do banco de dados PostgreSQL com todas as tabelas e relacionamentos]
) <fig-database-schema>

- Sistema de ownership tracking com 3 tipos de propriedade
- Schema ABAC completo com 8 tabelas para políticas e auditoria
- Índices estratégicos para performance otimizada

=== Principais Tabelas e Relacionamentos

#table(
  columns: (1.5fr, 1fr, 2fr),
  inset: 8pt,
  align: left,
  table.header([*Tabela*], [*Tipo*], [*Descrição*]),
  
  [`users`], [Principal], [Usuários com name, passwordHash e status],
  [`collections`], [Principal], [Definição de tipos de conteúdo],
  [`fields`], [Estrutural], [Campos com classificação de segurança],
  [`entries`], [Principal], [Instâncias de conteúdo com i18n],
  [`entry_texts`], [Dados], [Valores de campos de texto],
  [`entry_typst_texts`], [Dados], [Conteúdo Typst (raw + renderizado)],
  [`entry_booleans`], [Dados], [Valores booleanos],
  [`entry_numbers`], [Dados], [Valores numéricos],
  [`entry_datetimes`], [Dados], [Valores de data/hora],
  [`entry_rich_texts`], [Dados], [HTML/Markdown com formato],
  [`entry_json_data`], [Dados], [Estruturas complexas consolidadas],
  [`entry_assets`], [Referência], [Assets com ordenação múltipla],
  [`entry_relations`], [Referência], [Relacionamentos entre entradas],
  [`assets`], [Multimídia], [Arquivos com metadados de acessibilidade],
  [`abac_policies`], [Segurança], [Políticas de controle de acesso],
  [`abac_policy_rules`], [Segurança], [Regras específicas das políticas],
  [`abac_evaluation_cache`], [Performance], [Cache de decisões ABAC],
  [`abac_audit`], [Compliance], [Auditoria de decisões de acesso],
)

== Sistema de Controle de Acesso

=== Implementação ABAC (Attribute-Based Access Control)

O sistema implementa um sistema ABAC enterprise-grade nativo ao banco de dados, representando uma evolução significativa sobre modelos RBAC tradicionais. Esta abordagem oferece políticas declarativas, cache de performance e auditoria completa.

=== Arquitetura do Sistema ABAC

*Políticas ABAC* (`abac_policies`): Define políticas declarativas com efeito (ALLOW/DENY), prioridade para resolução de conflitos e conectores lógicos (AND/OR) para combinação de regras. Cada política especifica o tipo de recurso e ação que governa, com 15 ações granulares disponíveis.
#linebreak()
*Regras de Política* (`abac_policy_rules`): Contém as condições específicas dentro de cada política, definindo caminhos de atributos tipados, operadores de comparação e valores esperados. Suporta 13 operadores diferentes incluindo comparações numéricas, matches de string e verificações de arrays.
#linebreak()
*Cache de Avaliação* (`abac_evaluation_cache`): Sistema de cache de alta performance que armazena resultados de avaliação com TTL configurável, incluindo métricas de tempo de execução e invalidação baseada em checksum de contexto.
#linebreak()
*Auditoria Completa* (`abac_audit`): Log detalhado de todas as decisões de autorização incluindo contexto da requisição, políticas avaliadas, tempo de execução e razão da decisão para compliance e debugging.

=== Atributos Tipados e Type-Safe

O sistema define 28 caminhos de atributos tipados através do enum `attribute_path`:

*Atributos do Sujeito* (4 atributos):
- `subject.id`, `subject.role`, `subject.status`, `subject.createdAt`

*Atributos de Recursos*:
- Coleções (4 atributos): `resource.collection.id`, `resource.collection.slug`, `resource.collection.createdBy`, `resource.collection.isLocalized`
- Entradas (6 atributos): `resource.entry.id`, `resource.entry.status`, `resource.entry.createdBy`, `resource.entry.collectionId`, `resource.entry.locale`, `resource.entry.publishedAt`
- Campos (7 atributos): `resource.field.id`, `resource.field.name`, `resource.field.dataType`, `resource.field.sensitivityLevel`, `resource.field.isPii`, `resource.field.isPublic`, `resource.field.collectionId`
- Assets (4 atributos): `resource.asset.id`, `resource.asset.uploadedBy`, `resource.asset.mimeType`, `resource.asset.fileSize`

*Atributos Ambientais* (3 atributos):
- `environment.currentTime`, `environment.ipAddress`, `environment.userAgent`

*Atributos de Ação* (1 atributo):
- `action.type` com 15 ações específicas: create, read, update, delete, publish, unpublish, schedule, archive, restore, draft, ban, unban, activate, deactivate, upload, download, transform, configure_fields, manage_schema

=== Classificação de Sensibilidade de Dados

Os campos implementam classificação automática de sensibilidade através do campo `sensitivityLevel` com quatro níveis:

*PUBLIC*: Dados públicos sem restrições
*INTERNAL*: Dados internos da organização
*CONFIDENTIAL*: Dados sensíveis com acesso restrito
*RESTRICTED*: Dados altamente sensíveis com máxima proteção

Campos podem ser marcados como PII (`isPii`) e criptografados (`isEncrypted`), permitindo políticas específicas baseadas na classificação de dados.

=== Sistema de Ownership Dinâmico

A tabela `resource_ownerships` rastreia propriedade de recursos com três tipos:

*CREATOR*: Ownership automático baseado em criação
*ASSIGNED*: Ownership explicitamente atribuído por administradores
*INHERITED*: Ownership herdado de recursos pais

Este sistema permite políticas dinâmicas baseadas em propriedade com suporte a expiração temporal.

=== Performance e Otimização
#linebreak()
*Cache Multi-Layer*: Sistema de cache com invalidação inteligente baseada em checksum de contexto e versões de políticas, proporcionando latência sub-milissegundo para avaliações frequentes.
#linebreak()
*Índices Estratégicos*: 15+ índices específicos otimizam consultas por usuário, recurso, ação e tempo, garantindo performance escalável.
#linebreak()
*Métricas de Performance*: Cada avaliação inclui tempo de execução para identificação de políticas lentas e otimização contínua.

=== Resolução de Conflitos e Priorização

*Sistema de Prioridade*: Políticas possuem prioridade numérica para resolução determinística de conflitos entre ALLOW e DENY.
#linebreak()
*Conectores Lógicos*: Políticas podem usar AND (todas as regras devem ser verdadeiras) ou OR (qualquer regra verdadeira) para flexibilidade na definição de condições.
#linebreak()
*Deny-by-Default*: Sistema segue princípio de menor privilégio onde acesso é negado por padrão, requerendo políticas explícitas ALLOW.

=== Exemplo de Política Complexa

O sistema suporta políticas sofisticadas como:

"ALLOW READ em campos com sensitivityLevel='PUBLIC' OR (sensitivityLevel='INTERNAL' AND subject.role IN ['editor', 'admin'] AND environment.currentTime BETWEEN 09:00-17:00) DENY se field.isPii=true AND NOT subject.hasPrivacyTraining"

Esta política combina múltiplas dimensões de atributos para controle granular baseado em contexto dinâmico.

== APIs e Protocolos de Comunicação

=== API REST

A API REST é projetada especificamente para dois casos de uso onde simplicidade e compatibilidade são prioritárias:
#linebreak()
*Autenticação* (`/auth`): Endpoints para login, logout, refresh de tokens JWT e recuperação de senha. Esta implementação REST garante compatibilidade ampla com diferentes clientes e simplicidade na integração.
#linebreak()
*Gerenciamento de Assets* (`/assets`): Operações CRUD para arquivos multimídia, incluindo upload, download, streaming e metadados. A natureza binária dos assets e necessidades de streaming tornam REST mais apropriado que GraphQL.

*Características Técnicas*:
- Métodos HTTP apropriados: GET (leitura), POST (criação/upload), PUT/PATCH (atualização), DELETE (remoção)
- Códigos de status consistentes: 200 (sucesso), 201 (criado), 400 (erro cliente), 401 (não autenticado), 403 (não autorizado), 404 (não encontrado), 500 (erro servidor)
- Content-Type diversificado: multipart/form-data para uploads, application/json para metadados

=== API GraphQL

A implementação GraphQL serve como interface principal oferecendo flexibilidade superior para consultas complexas:

*Esquema*: O esquema GraphQL foi desenvolvido para facilitar o uso do sistema, as queries e mutations são formuladas de modo que o usuario não precise fazer relações manualmente.
#linebreak()
*Union Types para Flexibilidade*: Utilização de Union Types para representar diferentes tipos de campos (`FieldValue`), mantendo type safety para diferentes estruturas de dados:

```graphql
union FieldValue = Text | TypstText | Asset | BooleanValue | 
                   NumberValue | DateTime | RichText | Json | Relation
```

*Sistema de Filtering Avançado*: Implementação de filtros específicos por tipo de dado:
- Campos de texto: `contains`, `startsWith`, `endsWith`, `equals`
- Campos numéricos: `gt`, `gte`, `lt`, `lte`, `equals`
- Campos de data: `before`, `after`, `equals`
- Campos booleanos: `equals`
- Relacionamentos: `exists`, `in`, `notIn`

*Resolvers Otimizados*: Implementação de resolvers que aplicam filtros diretamente no banco de dados através de consultas SQL otimizadas, evitando over-fetching.
#linebreak()
*Paginação e Ordenação*: Suporte nativo a cursor-based pagination e ordenação multi-campo para consultas eficientes de grandes datasets.
#linebreak()
*Exemplo de Query Complexa*: O sistema suporta consultas sofisticadas que combinam metadados de coleção com filtragem de conteúdo:

```graphql
query ($name: String!, $fieldName2: String!) {
  collection(name: $name) {
    name
    fields {
      name
      dataType
    }
    entries {
      name
      test_field: field(name: $fieldName2, filter: { text: { eq: "wow!" } }) {
        ... on Text {
          text
        }
      }
    }
  }
}
```

Esta query demonstra a capacidade de buscar uma coleção específica, listar seus campos e metadados, e simultaneamente filtrar entradas baseando-se no valor de campos específicos, tudo em uma única requisição otimizada.

=== Middleware de Segurança

*Higher-Order Functions*: Sistema de proteção automática através de:
- `withAuth`: HOF que protege resolvers automaticamente
- `filterByPermission`: Função para filtragem ABAC de resultados
- `requirePermission`: Middleware para verificação de permissões
- `requireFieldPermission`: Sistema para controle field-level

*GraphQL Error Handling*: Tratamento padronizado de erros de autenticação e autorização com códigos HTTP apropriados.

== Interface Administrativa

=== Arquitetura Frontend

A interface administrativa utiliza SolidJS, oferecendo arquitetura reativa moderna:

*Reatividade Fine-Grained*: Atualizações cirúrgicas do DOM apenas nos elementos que efetivamente mudaram, eliminando reconciliação desnecessária.
#linebreak()
*Bundle Size Otimizado*: Aplicação administrativa com tamanho reduzido comparado a frameworks tradicionais.
#linebreak()
*Type Safety Completa*: Integração TypeScript end-to-end garantindo consistência entre frontend e backend.
#linebreak()
*Schema Adaptativo*: Interface que se adapta automaticamente aos tipos de campos definidos nas coleções, oferecendo widgets específicos para cada tipo de dados.

=== Funcionalidades Principais

*Dashboard Principal*: Interface central oferecendo visão geral das coleções, estatísticas de uso e navegação baseada em permissões ABAC.
#linebreak()
*Editor de Coleções*: Interface para definição dinâmica de tipos de conteúdo com preview em tempo real e validação de schemas.
#linebreak()
*Editor de Entradas*: Interface completamente adaptativa que gera formulários baseados no schema da coleção, com widgets específicos e validação em tempo real.
#linebreak()
*Gerenciador de Assets*: Sistema completo para upload, organização e metadados de arquivos multimídia, incluindo preview e campos de acessibilidade.
#linebreak()
*Sistema de Permissões*: Interface administrativa para configuração granular de políticas de permissoes.


== Segurança e Performance

=== Medidas de Segurança

*Autenticação por Nome de Usuário*: Sistema baseado nos campos `name` e `passwordHash` da tabela users, com status de conta controlado pelo enum `user_status`.
#linebreak()
*Sistema de Sessões Seguro*: Gerenciamento com TTL configurável, extensão automática e cache Redis para performance.
#linebreak()
*Validação Rigorosa*: Validação de inputs via JSON Schema, sanitização de dados e queries SQL seguras via Drizzle ORM.
#linebreak()
*Encryption at Rest*: Suporte a criptografia de campos sensíveis através do flag `isEncrypted`.

=== Otimizações de Performance

*Database Indexing*: Estratégia abrangente com 15+ índices específicos incluindo índices compostos para consultas ABAC.
#linebreak()
*Connection Pooling*: Gerenciamento otimizado de conexões PostgreSQL.
#linebreak()
*GraphQL Optimizations*: DataLoader para batching de consultas e prevenção do problema N+1.
