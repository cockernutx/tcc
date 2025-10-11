#import "./udf-tcc-template/template.typ": *

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
  bibliography: "../refs.yml"
)

// ===========================================
// CAPÍTULO 1 - DEFINIÇÃO DO PROBLEMA, OBJETIVOS E METODOLOGIA
// ===========================================

= Introdução

Criar um site interativo que funcione com banco de dados é um dos maiores desafios no desenvolvimento de sites modernos. Para fazer isso, o desenvolvedor precisa dominar várias tecnologias diferentes ao mesmo tempo, incluindo tanto a camada de apresentação quanto a lógica de negócios e persistência de dados - tudo precisa funcionar junto de forma harmoniosa.

A complexidade aumenta quando consideramos os requisitos não-funcionais como performance sob carga, responsividade em múltiplos dispositivos, segurança contra ataques e gerenciamento adequado de permissões de acesso. Tudo isso exige conhecimento multidisciplinar e experiência prática, tornando o desenvolvimento um processo complexo e demorado.

== Objetivos


Desenvolver um sistema de gerenciamento de conteúdo headless (CMS Headless) que permita a criação, edição e distribuição de conteúdo de forma desacoplada, oferecendo flexibilidade para desenvolvedores criarem interfaces personalizadas enquanto mantém a facilidade de uso para editores de conteúdo, demonstrando na prática as vantagens arquiteturais desta abordagem moderna em comparação aos CMS tradicionais.

=== Objetivos Específicos

1. Desenvolver uma interface administrativa web para facilitar o gerenciamento de conteúdo sem necessidade de ferramentas externas
2. Desenvolver bibliotecas de acesso para facilitar o uso do sistema.

== Metodologia

O projeto será desenvolvido utilizando metodologia ágil com ciclos iterativos de desenvolvimento. A implementação seguirá uma abordagem em camadas, iniciando pela infraestrutura de dados e progredindo até a interface de usuário.

*Fase 1 - Fundação*: Implementação da arquitetura do banco de dados e sistema de autenticação, estabelecendo a base para as demais funcionalidades.

*Fase 2 - Core*: Desenvolvimento das funcionalidades principais de gerenciamento de coleções e entradas de conteúdo, incluindo o sistema ABAC para controle de acesso.

*Fase 3 - APIs*: Implementação das camadas de comunicação REST e GraphQL com seus respectivos sistemas de resolução e otimização.

*Fase 4 - Interface*: Desenvolvimento do painel administrativo com interface adaptativa baseada nos schemas definidos.

*Fase 5 - Validação*: Testes de funcionalidade, performance e segurança, seguidos de ajustes e otimizações.

// ================================
// CAPÍTULO 2 - REFERENCIAL TEÓRICO
// ================================

= Referencial Teórico

Este capítulo apresenta o referencial teórico fundamental para compreensão dos conceitos, tecnologias e metodologias empregadas no desenvolvimento do sistema proposto, abrangendo desde fundamentos de CMS tradicionais até arquiteturas headless modernas e sistemas avançados de controle de acesso.

== Sistemas de Gerenciamento de Conteúdo (CMS)

Um Sistema de Gerenciamento de Conteúdo (ou CMS, da sigla em inglês Content Management System) é como um painel de controle para gerenciar o conteúdo de um site. Ele permite que pessoas sem conhecimento técnico possam criar, editar e publicar textos, imagens e vídeos em um site, sem precisar saber programação.

Pense no CMS como um editor de documentos, similar ao Microsoft Word, mas para sites. Em vez de precisar escrever código para adicionar uma nova notícia ou atualizar uma foto, você simplesmente usa uma interface visual, clica em botões e preenche formulários.

=== A Evolução dos CMS

Os CMS passaram por três fases importantes:

*Primeira Geração - Sites Estáticos*: No início da internet, qualquer mudança em um site exigia que um programador alterasse o código manualmente. Era como ter que chamar um engenheiro toda vez que você quisesse mudar a cor de uma parede da sua casa.

*Segunda Geração - CMS Tradicionais*: Surgiram sistemas como WordPress e Joomla, que tornaram a criação de sites muito mais fácil. Hoje, o WordPress é usado por mais de 40% de todos os sites do mundo. Esses sistemas são como blocos de montar: você escolhe um tema visual pronto, instala algumas extensões, e tem um site funcionando.

*Terceira Geração - CMS Headless (Modernos)*: É a fase atual, onde o sistema separa completamente o gerenciamento do conteúdo da apresentação visual. Isso dá muito mais liberdade para os desenvolvedores criarem diferentes tipos de interfaces.

=== Componentes Básicos de um CMS

Todo CMS moderno possui cinco partes essenciais:

1. *Painel Administrativo*: Onde você cria e edita o conteúdo (textos, imagens, vídeos)
2. *Banco de Dados*: Onde todas as informações são armazenadas de forma organizada
3. *Sistema de Publicação*: Que cuida de mostrar o conteúdo para os visitantes
4. *Controle de Acesso*: Que define quem pode ver ou editar cada coisa
5. *Conexões com Outros Sistemas*: Para integrar com redes sociais, sistemas de pagamento, etc.

=== Três Tipos de CMS

Hoje existem três categorias principais de CMS:

*CMS Tradicionais*: Como o WordPress, onde tudo vem junto em um pacote único. São fáceis de usar e instalar, mas têm limitações quando você precisa de algo mais personalizado ou quando o site cresce muito.

*CMS Headless (Desacoplados)*: Separam o gerenciamento de conteúdo da apresentação visual. É como ter uma biblioteca central de conteúdo que pode alimentar simultaneamente seu site, aplicativo de celular e até assistentes de voz. Oferece muito mais flexibilidade, mas é mais complexo de configurar.

*CMS Híbridos*: Combinam as duas abordagens, permitindo usar o sistema da forma tradicional ou moderna, conforme a necessidade do projeto.

== Controle de Acesso: Do Sistema de Papéis ao Sistema de Atributos

=== O Sistema Tradicional: RBAC (Controle Baseado em Papéis)

Imagine uma empresa onde existem diferentes cargos: gerente, editor e visitante. O sistema RBAC (sigla em inglês para Role-Based Access Control, ou "Controle de Acesso Baseado em Papéis") funciona exatamente assim - você atribui um "papel" ou "cargo" para cada usuário, e esse papel define o que a pessoa pode ou não fazer.

Por exemplo:
- Um *Gerente* pode criar, editar e excluir qualquer conteúdo
- Um *Editor* pode criar e editar, mas não excluir
- Um *Visitante* pode apenas visualizar

Esse sistema funcionou bem por muitos anos e ainda é amplamente usado. No entanto, ele tem três problemas principais:

*Explosão de Papéis*: Em empresas grandes, você acaba precisando criar muitos papéis diferentes. Por exemplo: "Editor de Notícias", "Editor de Esportes", "Editor de Tecnologia", "Editor Sênior de Notícias"... A lista cresce rapidamente e fica difícil de gerenciar.

*Falta de Flexibilidade com Contexto*: O RBAC não consegue criar regras como "Editores só podem publicar durante horário comercial" ou "Este conteúdo só pode ser acessado de dentro da empresa". Ele não considera a situação em que a pessoa está.

*Controle Limitado*: É difícil criar regras muito específicas, como "este usuário pode editar o título mas não o corpo do texto" ou "pode ver alguns campos mas não outros".

=== O Sistema Moderno: ABAC (Controle Baseado em Atributos)

O ABAC (Attribute-Based Access Control, ou "Controle de Acesso Baseado em Atributos") é uma evolução que resolve esses problemas. Em vez de simplesmente olhar o "cargo" da pessoa, o sistema analisa várias características ou "atributos" antes de decidir se permite ou não uma ação.

O ABAC considera quatro tipos de informação:

1. *Atributos da Pessoa*: Quem é o usuário (seu ID, cargo, departamento, há quanto tempo trabalha na empresa)
2. *Atributos do Conteúdo*: O que está sendo acessado (tipo de documento, quem criou, nível de confidencialidade, data de criação)
3. *Atributos da Ação*: O que a pessoa quer fazer (ler, editar, excluir, publicar)
4. *Atributos do Ambiente*: Em que situação (horário do dia, localização, tipo de dispositivo usado)

Com ABAC, você pode criar regras mais inteligentes como:

"Médicos podem acessar prontuários de pacientes do seu departamento, mas apenas durante o horário de trabalho e usando um dispositivo aprovado pelo hospital"

Essa regra seria extremamente difícil (ou impossível) de implementar com o sistema tradicional de papéis.

=== Como o ABAC Funciona

O sistema ABAC possui quatro componentes principais que trabalham juntos:

*Ponto de Decisão (PDP)*: É como um juiz que analisa as regras e decide se permite ou nega o acesso. Ele recebe informações sobre quem está tentando fazer o quê, consulta as políticas definidas e dá um veredicto: "permitido" ou "negado".

*Ponto de Aplicação (PEP)*: É como um guarda de segurança que intercepta toda tentativa de acesso. Quando alguém tenta fazer algo, o PEP para a requisição e pergunta ao PDP se pode permitir. Só depois da aprovação é que a ação acontece.

*Ponto de Informação (PIP)*: É como um banco de dados de informações. Quando o PDP precisa saber se o usuário pertence a determinado departamento ou se hoje é dia útil, ele busca essas informações no PIP.

*Ponto de Administração (PAP)*: É a interface onde os administradores criam e gerenciam as regras de acesso. Funciona como um painel de controle para definir quem pode fazer o quê e em que situação.

=== Por Que o ABAC é Melhor para Sistemas Modernos

O ABAC oferece quatro vantagens principais:

*Mais Expressivo*: Permite criar regras complexas e inteligentes em linguagem quase natural, considerando múltiplos fatores ao mesmo tempo.

*Mais Flexível*: As regras se adaptam automaticamente às mudanças. Se um funcionário muda de departamento, suas permissões mudam automaticamente sem precisar alterar configurações manualmente.

*Mais Granular*: Permite controlar o acesso em nível muito detalhado, até mesmo campo por campo em um formulário. Essencial para sistemas de gerenciamento de conteúdo onde diferentes informações têm diferentes níveis de sensibilidade.

*Mais Contextual*: Leva em conta a situação em que o acesso está acontecendo - horário, local, dispositivo - criando um sistema de segurança mais inteligente e adaptável.

=== Aplicações Práticas do ABAC em Sistemas de Conteúdo

Para sistemas de gerenciamento de conteúdo especificamente, o ABAC traz benefícios muito úteis:

*Controle de Horário de Publicação*: Você pode criar regras como "Artigos só podem ser publicados durante horário comercial e apenas por editores seniores". Isso evita publicações acidentais fora de hora.

*Personalização por Perfil*: Diferentes grupos de usuários podem ver conteúdos diferentes automaticamente, sem precisar criar versões separadas do sistema.

*Trabalho em Equipe por Projeto*: Quando alguém é adicionado a um projeto, ganha acesso automaticamente a todos os conteúdos relacionados. Quando sai do projeto, perde o acesso automaticamente.

*Conformidade com Leis de Privacidade*: Regulamentos como a LGPD (Lei Geral de Proteção de Dados) exigem controles específicos sobre dados pessoais. O ABAC permite criar essas proteções de forma automática e auditável.

== Arquitetura Headless: Separando a "Cabeça" do "Corpo"

=== O Que É um CMS Headless

Imagine que um site tradicional é como um boneco de ação: a cabeça (a parte visual que as pessoas veem) está permanentemente grudada no corpo (o banco de dados e a lógica). Se você quiser trocar apenas a cabeça, precisa desmontar tudo.

Um CMS Headless é diferente: a "cabeça" (frontend - a parte visual) está completamente separada do "corpo" (backend - onde os dados ficam). Eles conversam através de uma ponte chamada API (Interface de Programação de Aplicações). É como ter peças de LEGO que se encaixam mas podem ser trocadas independentemente.

=== API-First: Construindo Pela Ponte de Comunicação

O conceito "API-first" significa que, ao construir o sistema, a primeira coisa que criamos é essa "ponte de comunicação" (a API). É como construir primeiro as estradas antes de construir as cidades - garante que tudo possa se conectar bem depois.

Essa abordagem permite o "Content as a Service" (CaaS), ou "Conteúdo como Serviço". Pense no conteúdo como água em uma caixa d'água central: você pode conectar vários canos (sites, apps, dispositivos) nessa mesma fonte. Um único conteúdo alimenta múltiplas saídas.

=== Vantagens da Arquitetura Headless

*Liberdade Tecnológica*: Você pode usar as melhores ferramentas para cada parte. Diferentes tecnologias de interface podem coexistir - site, aplicativo móvel e painel administrativo podem usar tecnologias distintas, mas todos consomem os mesmos dados do backend.

*Escalabilidade Independente*: Se o site está recebendo muito tráfego, você pode aumentar apenas os recursos do frontend. Se precisa processar mais conteúdo, aumenta apenas o backend. É como poder expandir cômodos específicos da casa sem mexer nos outros.

*Reutilização Máxima de Conteúdo*: Escreva um conteúdo uma vez, use em todos os lugares. O mesmo artigo pode aparecer no site, no aplicativo de celular, em assistentes de voz (como Alexa), em smartwatches, em telas de aeroporto - tudo automaticamente.

*Estratégia Omnichannel*: Omnichannel significa "todos os canais". Você oferece uma experiência unificada para seus usuários em qualquer plataforma que eles escolham usar.

=== Desafios da Arquitetura Headless

Nem tudo são flores. A arquitetura headless traz alguns desafios:

*Complexidade Inicial Maior*: Configurar um sistema headless é mais complicado do que instalar um WordPress. Você precisa configurar o backend, depois o frontend, e garantir que eles conversem direito.

*Exige Mais Conhecimento Técnico*: Para usar um WordPress você pode aprender na hora. Para um sistema headless, você precisa entender conceitos de APIs, requisições HTTP, e como conectar sistemas diferentes.

*Coordenação Entre Equipes*: Se você tem uma equipe cuidando do backend e outra do frontend, elas precisam se comunicar constantemente para garantir que tudo funcione bem junto.

== GraphQL: Uma Forma Mais Inteligente de Buscar Dados

=== O Problema com APIs Tradicionais (REST)

Imagine que você vai a um restaurante e pede um prato específico. Com APIs REST tradicionais, é como se o garçom trouxesse a refeição completa mesmo que você só quisesse a salada. Ou então você precisasse fazer três pedidos diferentes para conseguir montar sua refeição completa - um pedido para o prato principal, outro para a bebida, outro para a sobremesa.

Isso causa dois problemas principais:
1. *Over-fetching*: Receber mais dados do que você precisa (desperdício de internet e processamento)
2. *Under-fetching*: Precisar fazer várias requisições separadas para conseguir todos os dados necessários (lentidão)

=== Como o GraphQL Resolve Isso

O GraphQL, criado pelo Facebook em 2015, funciona como um cardápio inteligente. Você diz exatamente o que quer, na quantidade que quer, e recebe apenas isso - tudo de uma vez só.

Com GraphQL, você faz uma única pergunta detalhada e recebe exatamente o que pediu. É como dizer ao garçom: "Quero o frango grelhado, mas só a carne e o molho, sem os legumes. E também quero suco de laranja sem gelo." E receber exatamente isso.

=== Características Principais do GraphQL

*Sistema de Tipos*: O GraphQL funciona como um contrato bem definido. Ele especifica exatamente que tipos de dados existem e o que você pode pedir. É como ter um cardápio detalhado que mostra todos os ingredientes disponíveis e como eles podem ser combinados.

*Ponto Único de Entrada*: Em vez de ter múltiplos endereços (URLs) diferentes para buscar dados, o GraphQL usa um único ponto de entrada. É como ter um balconista único que te ajuda com qualquer pedido, em vez de precisar ir a vários guichês diferentes.

*Consultas Flexíveis*: Você monta sua consulta pedindo exatamente os campos que precisa. Quer apenas o título e a data de um artigo? Peça só isso. Quer o artigo completo com autor e comentários? Também pode pedir tudo de uma vez.

=== GraphQL em Sistemas de Conteúdo

Para sistemas de gerenciamento de conteúdo, o GraphQL é especialmente útil porque:

*Adaptação a Diferentes Tipos*: O projeto usa "Union Types" (tipos unidos) que permitem que um campo possa conter diferentes tipos de dados - texto, número, data, imagem - e o GraphQL sabe lidar com cada um adequadamente.

*Filtros Inteligentes*: Você pode fazer buscas específicas:
- Em campos de texto: buscar coisas que "contêm" uma palavra, que "começam com" ou "terminam com" algo
- Em campos numéricos: buscar valores maiores que, menores que, iguais a um número
- Em campos de data: buscar conteúdos antes ou depois de uma data específica

*Performance Otimizada*: O sistema é inteligente o suficiente para transformar sua consulta GraphQL em comandos otimizados para o banco de dados, buscando apenas o necessário e filtrando direto na fonte.

== Modelagem de Dados Dinâmica e Flexível

A modelagem de dados para CMS que permitem definição dinâmica de tipos de conteúdo apresenta desafios únicos na engenharia de software. Segundo @kleppmann2017designing, sistemas que necessitam de flexibilidade de esquema devem balancear cuidadosamente entre performance de consultas e adaptabilidade estrutural.

O padrão Entity-Attribute-Value (EAV) tradicionalmente usado para esquemas dinâmicos apresenta limitações significativas em performance e complexidade de consultas. Para endereçar estas limitações, o sistema proposto implementa uma abordagem híbrida que combina tabelas tipadas para tipos de dados primitivos com armazenamento JSON para estruturas complexas.

A arquitetura de dados implementa estratégias diferenciadas baseadas na natureza dos tipos de dados:

*Tipos Primitivos*: Text, boolean, number e date_time são armazenados em tabelas dedicadas (entry_texts, entry_booleans, entry_numbers, entry_datetimes). Esta abordagem permite indexação eficiente e consultas otimizadas para operações comuns como busca textual e comparações numéricas.

*Tipos Complexos*: Object, text_list, number_list e json são armazenados na tabela unificada entry_json_data, aproveitando as capacidades nativas de bancos de dados relacionais modernos para dados semi-estruturados. O campo value_type permite distinguir entre diferentes estruturas JSON, mantendo type safety a nível de aplicação.

*Tipos Especiais*: Assets utilizam tabela de referência (entry_assets) para metadados de arquivos, enquanto rich_text implementa armazenamento dual (raw + rendered) para otimização de performance de renderização.

*Relacionamentos*: A tabela entry_relations gerencia referências entre entradas, suportando relacionamentos um-para-um, um-para-muitos e muitos-para-muitos através de configuração de campo.

== Frameworks e Padrões para Implementação de ABAC

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

XACML permanece como padrão OASIS principal para linguagem de políticas ABAC. Conforme especificado por @oasis2013xacml, XACML define arquitetura, protocolo request/response e 13 algoritmos de combinação para resolução de conflitos entre políticas.

A estrutura hierárquica do XACML inclui:
- *Rules*: Unidade básica de política com condição e efeito
- *Policies*: Conjunto de rules com algoritmo de combinação
- *PolicySets*: Container para policies com meta-políticas

Algoritmos de combinação como `deny-overrides` e `permit-overrides` resolvem conflitos sistematicamente, essencial para implementações robustas em sistemas enterprise.

*Casbin*: Biblioteca multi-linguagem que oferece ABAC simplificado usando structs/objetos, popular para implementações em Node.js e Python @casbin2024docs.

*AWS IAM com Tags*: Implementa ABAC nativamente usando tags como atributos, demonstrando escalabilidade enterprise em ambientes cloud @aws2024abac.

*Apache Ranger*: Framework abrangente para segurança de dados com suporte nativo para tag-based ABAC policies e integração com Apache Atlas @ranger2024docs.

== Segurança e Performance em Sistemas ABAC

A literatura identifica vulnerabilidades específicas do ABAC que exigem mitigação cuidadosa:

*Attribute Poisoning*: Atacantes manipulam atributos de entrada para obter acesso não autorizado. @avatier2024security demonstra mitigação através de verificação criptográfica de asserções e validação em tempo real.

*Inference Attacks*: Exploração de padrões comportamentais para inferir regras de políticas. Defendido por limitação da visibilidade de regras aplicáveis e obfuscação de decisões.

*Policy Conflicts*: Múltiplas políticas podem produzir decisões conflitantes. @oasis2013xacml especifica algoritmos formais para resolução, enquanto @combiningpolicies2009 analisa teoria e prática de combinação de políticas.

Benchmarks de performance mostram engines XACML modernos avaliando 10.000 requests em ~10 milissegundos @performance2024abac. Técnicas de otimização incluem:

*Smart Mask Ordering*: Reordenação de avaliação de atributos por probabilidade de decisão, resultando em 89% de melhoria de performance.

*Attribute Caching*: Cache distribuído de atributos frequentemente acessados, reduzindo latência de PIPs externos.

*Policy Indexing*: Estruturas de dados otimizadas para busca rápida de políticas aplicáveis baseada em atributos de contexto.

== Comparação com Outros Sistemas

Para entender melhor o que este projeto oferece, vamos comparar com outros sistemas de gerenciamento de conteúdo existentes no mercado.

=== WordPress: O Gigante Tradicional

O WordPress é o sistema de gerenciamento de conteúdo mais popular do mundo, usado por mais de 40% de todos os sites. Ele representa o modelo tradicional onde tudo vem em um pacote único.

*Pontos Fortes*: Fácil de usar, tem milhares de temas e plugins prontos, grande comunidade de suporte.

*Limitações*: Quando o site cresce muito ou precisa se integrar com aplicativos de celular, o WordPress mostra suas limitações. Ele não foi feito pensando em arquitetura headless, então usá-lo apenas como backend não é muito eficiente.

=== Joomla: O Meio-Termo

O Joomla é uma alternativa ao WordPress que oferece controle de usuários e permissões um pouco mais robusto, mas ainda mantém a estrutura tradicional onde tudo está acoplado.

=== Strapi: O Principal Concorrente Headless

O Strapi é o CMS headless open-source (código aberto) mais conhecido atualmente. Ele compartilha várias ideias com este projeto:

*Semelhanças*:
- Permite criar coleções de conteúdo personalizadas
- Oferece APIs GraphQL e REST
- Tem sistema de permissões baseado em papéis (roles)
- Suporta vários tipos de dados diferentes

*Diferenças Importantes*:

*Controle de Permissões*: O Strapi usa apenas o sistema tradicional RBAC (controle por papéis), que só permite definir permissões por tipo de conteúdo inteiro. Este projeto usa ABAC, permitindo controle muito mais fino - até mesmo por campo individual e considerando o contexto (horário, localização, etc.).

*Organização dos Dados*: Este projeto usa uma estratégia híbrida que organiza os dados de forma mais otimizada dependendo do tipo de informação, resultando em consultas mais rápidas.

*Regras Contextuais*: O Strapi não consegue criar regras como "só pode publicar durante horário comercial" ou "só pode acessar deste local". Este projeto implementa essas capacidades através do ABAC.

=== Casos de Uso no Mundo Real

Várias organizações grandes já usam sistemas com ABAC:

*Plataformas Educacionais*: Universidades usam ABAC para controlar quem pode acessar materiais de diferentes cursos, considerando matriculação, período letivo e outras variáveis.

*Gerenciadores de Conteúdo Corporativo*: Empresas como Adobe implementam controle baseado em metadados, aplicando automaticamente regras por departamento, região geográfica e nível de confidencialidade.

*Serviços de Streaming*: A Netflix utiliza sistemas de controle de acesso avançados para gerenciar permissões em sua arquitetura de microserviços de alta performance.

== Tecnologias de Interface Moderna

As tecnologias de interface modernas representam uma evolução significativa no desenvolvimento de aplicações web, oferecendo diferentes abordagens para gerenciamento de estado e atualização de interfaces de usuário.

Para aplicações de gerenciamento de conteúdo, as características das tecnologias de interface modernas oferecem vantagens específicas:

*Tamanho Otimizado*: Tecnologias modernas oferecem pacotes menores e tempo de carregamento reduzido, beneficiando dashboards administrativos que frequentemente incluem múltiplas bibliotecas especializadas.

*Performance Consistente*: Técnicas modernas de atualização de interface oferecem renderização mais eficiente para aplicações que manipulam grandes volumes de dados, como listas de entradas de conteúdo ou árvores de categorias.

*Experiência do Desenvolvedor*: Sintaxes declarativas modernas reduzem a curva de aprendizado para desenvolvedores, facilitando migração e onboarding de equipes.

// ================================
// CAPÍTULO 3 - CONCEITO E DESIGN DO SISTEMA
// ================================

= Conceito e Design do Sistema

Este capítulo explica como o sistema foi pensado e construído, quais tecnologias foram escolhidas e por que, e como todas as partes trabalham juntas para criar uma solução completa de gerenciamento de conteúdo.

== Arquitetura do Sistema

O sistema adota arquitetura em três camadas com separação clara de responsabilidades e comunicação via interfaces bem definidas.

#figure(
  image("diagramas/Diagrama do sistema.png", width: 100%),
  caption: [Estrutura do sistema mostrando como as três camadas principais se conectam]
) <fig-system-diagram>

=== Camadas Arquiteturais

*Camada de Persistência*:
- Banco de dados relacional para dados estruturados e relacionais
- Sistema de cache em memória para sessões e resultados de avaliações ABAC

*Camada de Aplicação*:
- API GraphQL como interface principal de consulta
- Endpoints REST para autenticação e gerenciamento de assets
- Motor ABAC integrado para controle de acesso

*Camada de Apresentação*:
- Painel administrativo implementado com tecnologia de interface moderna
- Frontend consumidor pode ser implementado em qualquer tecnologia

=== Decisões Arquiteturais

A arquitetura foi projetada priorizando:

*Separação de Responsabilidades*: Cada camada possui escopo bem definido, facilitando manutenção e evolução independente dos componentes.

*Desacoplamento via APIs*: A comunicação entre camadas ocorre exclusivamente através de interfaces contratuais, permitindo substituição de implementações sem impacto em outras camadas.

*Escalabilidade Horizontal*: As camadas podem escalar independentemente baseado na demanda específica de cada componente.

*Flexibilidade Tecnológica*: A camada de apresentação não está acoplada a nenhuma tecnologia específica, permitindo múltiplas implementações consumindo as mesmas APIs.

== Stack Tecnológico

A seleção das tecnologias priorizou maturidade do ecossistema, performance e type safety.

=== Camada de Backend

*Linguagem com Tipagem Estática*: Escolhida pela adequação a operações I/O intensivas comuns em APIs. A tipagem estática reduz erros em tempo de execução e melhora a experiência de desenvolvimento.

*Banco de Dados Relacional*: Selecionado pelos recursos avançados incluindo conformidade ACID, suporte nativo a JSON para dados semi-estruturados, sistema robusto de indexação e extensibilidade. A capacidade de trabalhar com dados relacionais e documentos simultaneamente elimina a necessidade de múltiplos sistemas de persistência.

*Sistema de Cache em Memória*: Utilizado como cache de alta performance para sessões e resultados de avaliações ABAC. A arquitetura em memória proporciona latências sub-milissegundo, essencial para operações frequentes de autorização.

*Camada de Acesso a Dados*: Implementada com segurança de tipos completa entre a linguagem de aplicação e SQL, mantendo controle fino sobre queries geradas e evitando overhead desnecessário.

=== Camada de Frontend

*Tecnologia de Interface Moderna*: Selecionada por oferecer atualizações eficientes de interface, resultando em tamanho de aplicação reduzido e performance superior. A sintaxe declarativa facilita adoção por desenvolvedores.

=== APIs

*GraphQL*: Implementado como interface principal permitindo consultas flexíveis e eliminando over-fetching. O sistema de tipos forte garante contratos explícitos entre cliente e servidor.

*REST*: Mantido para operações específicas (autenticação e assets) onde a simplicidade do modelo request-response é mais adequada que a complexidade do GraphQL.

=== Segurança

*JWT com Criptografia Assimétrica*: Tokens assinados criptograficamente garantem autenticidade sem necessidade de estado no servidor, facilitando escalabilidade horizontal. O algoritmo assimétrico permite validação distribuída sem compartilhamento de segredos.

*Gerenciamento de Sessões*: TTL automático, renovação baseada em atividade e cache de atributos de autorização reduzem carga no banco de dados principal.

*Criptografia de Transporte*: Protocolos modernos garantindo confidencialidade e integridade de todas as comunicações cliente-servidor.


== Modelagem do Banco de Dados

A modelagem de dados implementa estratégia híbrida combinando tabelas tipadas para primitivos com armazenamento JSON para estruturas complexas, conforme discutido no referencial teórico.

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

Implementação da abordagem híbrida discutida no referencial teórico:

*Tipos Primitivos* (text, boolean, number, date_time): Tabelas dedicadas (`entry_texts`, `entry_booleans`, `entry_numbers`, `entry_datetimes`) com índices para consultas otimizadas.

*Tipo Typst* (typst_text): Tabela especializada (`entry_typst_texts`) mantendo código fonte e versão renderizada.

*Tipos Complexos* (text_list, number_list, json): Tabela unificada `entry_json_data` aproveitando suporte nativo do PostgreSQL a JSONB.

*Rich Text*: Tabela `entry_rich_texts` com armazenamento triplo (raw + rendered + format) suportando markdown, HTML e ProseMirror.

*Assets*: Tabela `entry_assets` com ordenação múltipla e metadados de acessibilidade.

*Relacionamentos*: Tabela `entry_relations` gerenciando relacionamentos com suporte a consultas aninhadas.

=== Diagrama Entidade-Relacionamento

O diagrama ER apresentado na Figura 3.2 demonstra as principais entidades e seus relacionamentos:

#figure(
  image("diagramas/database.png", width: 100%),
  caption: [Esquema completo do banco de dados relacional com todas as tabelas e relacionamentos]
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

Implementação do modelo ABAC discutido no referencial teórico, com políticas declarativas armazenadas no banco de dados e motor de avaliação integrado.

*Políticas ABAC* (`abac_policies`): Define políticas declarativas com efeito (ALLOW/DENY), prioridade para resolução de conflitos e conectores lógicos (AND/OR) para combinação de regras. Cada política especifica o tipo de recurso e ação que governa, com 15 ações granulares disponíveis.

*Regras de Política* (`abac_policy_rules`): Contém as condições específicas dentro de cada política, definindo caminhos de atributos tipados, operadores de comparação e valores esperados. Suporta 13 operadores diferentes incluindo comparações numéricas, matches de string e verificações de arrays.

*Cache de Avaliação* (`abac_evaluation_cache`): Sistema de cache de alta performance que armazena resultados de avaliação com TTL configurável, incluindo métricas de tempo de execução e invalidação baseada em checksum de contexto.

*Auditoria Completa* (`abac_audit`): Log detalhado de todas as decisões de autorização incluindo contexto da requisição, políticas avaliadas, tempo de execução e razão da decisão para compliance e debugging.

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

Os campos implementam classificação automática de sensibilidade através do campo `sensitivityLevel` com quatro níveis:

*PUBLIC*: Dados públicos sem restrições
*INTERNAL*: Dados internos da organização
*CONFIDENTIAL*: Dados sensíveis com acesso restrito
*RESTRICTED*: Dados altamente sensíveis com máxima proteção

Campos podem ser marcados como PII (`isPii`) e criptografados (`isEncrypted`), permitindo políticas específicas baseadas na classificação de dados.

A tabela `resource_ownerships` rastreia propriedade de recursos com três tipos:

*CREATOR*: Ownership automático baseado em criação
*ASSIGNED*: Ownership explicitamente atribuído por administradores
*INHERITED*: Ownership herdado de recursos pais

Este sistema permite políticas dinâmicas baseadas em propriedade com suporte a expiração temporal.

=== Otimizações e Características de Implementação

*Performance*:
- Cache multi-layer com invalidação baseada em checksum de contexto
- 15+ índices estratégicos otimizando consultas ABAC
- Métricas de tempo de execução para profiling

*Resolução de Conflitos*:
- Sistema de prioridade numérica para resolução determinística
- Conectores lógicos AND/OR para combinação de regras
- Arquitetura deny-by-default seguindo princípio de menor privilégio

Exemplo de política complexa implementável:

```
ALLOW READ ON fields WHERE
  sensitivityLevel = 'PUBLIC' OR
  (sensitivityLevel = 'INTERNAL' AND
   subject.role IN ['editor', 'admin'] AND
   environment.currentTime BETWEEN 09:00-17:00)
DENY IF field.isPii = true AND NOT subject.hasPrivacyTraining
```

== APIs e Protocolos de Comunicação

O sistema oferece duas interfaces de comunicação complementares, cada uma otimizada para casos de uso específicos.

=== API REST

Implementada para operações onde simplicidade e compatibilidade são prioritárias:

*Autenticação* (`/auth`): Login, logout, refresh de tokens e recuperação de senha.

*Assets* (`/assets`): Upload, download e streaming de arquivos multimídia. A natureza binária e necessidades de streaming justificam REST sobre GraphQL.

*Convenções*:
- Métodos HTTP semânticos (GET, POST, PUT/PATCH, DELETE)
- Status codes consistentes (2xx sucesso, 4xx erro cliente, 5xx erro servidor)
- Content-Type apropriado (multipart/form-data para uploads, application/json para metadados)

=== API GraphQL

Interface principal do sistema, oferecendo flexibilidade superior conforme discutido no referencial teórico.

*Design do Esquema*: Queries e mutations estruturadas para eliminar necessidade de joins manuais pelo cliente.

*Union Types para Flexibilidade*: Utilização de Union Types para representar diferentes tipos de campos (`FieldValue`), mantendo type safety para diferentes estruturas de dados:

```graphql
union FieldValue = Text | TypstText | Asset | BooleanValue | 
                   NumberValue | DateTime | RichText | Json | Relation
```

*Sistema de Filtering*: Filtros específicos por tipo implementando os operadores discutidos no referencial teórico:
- Texto: `contains`, `startsWith`, `endsWith`, `equals`
- Numérico: `gt`, `gte`, `lt`, `lte`, `equals`
- Data: `before`, `after`, `equals`
- Booleano: `equals`
- Relacionamentos: `exists`, `in`, `notIn`

*Otimizações*:
- Resolvers aplicam filtros diretamente no banco via SQL otimizado
- Cursor-based pagination para datasets grandes
- Ordenação multi-campo

Exemplo de query combinando metadados de coleção com filtragem de conteúdo:

```graphql
query ($name: String!, $fieldName: String!) {
  collection(name: $name) {
    name
    fields { name dataType }
    entries {
      name
      field(name: $fieldName, filter: { text: { eq: "value" } }) {
        ... on Text { text }
      }
    }
  }
}
```

*Integração com ABAC*:
- Higher-order functions protegendo resolvers automaticamente
- Filtragem de resultados baseada em permissões do usuário
- Controle field-level impedindo acesso a campos restritos
- Error handling padronizado para autenticação e autorização

== Interface Administrativa

Implementação utilizando tecnologia de interface moderna aproveitando as características discutidas no referencial teórico.

=== Características Técnicas

*Arquitetura Reativa*: Atualizações eficientes de interface baseadas em mudanças de estado.

*Segurança de Tipos*: Integração com tipagem estática end-to-end entre frontend e backend.

*Interface Adaptativa*: UI se adapta automaticamente aos schemas definidos, gerando formulários e widgets específicos por tipo de campo.

=== Módulos Principais

*Dashboard*: Visão geral de coleções, estatísticas e navegação filtrada por permissões ABAC.

*Editor de Coleções*: Definição de tipos de conteúdo com validação em tempo real.

*Editor de Entradas*: Formulários gerados dinamicamente baseados no schema da coleção.

*Gerenciador de Assets*: Upload e organização de mídias com metadados de acessibilidade.

*Configuração de Permissões*: Interface para criação e gerenciamento de políticas ABAC.


== Segurança e Performance

=== Medidas de Segurança Implementadas

*Autenticação*: Sistema baseado em credenciais (username/password) com hashing criptográfico seguro.

*Sessões*: Gerenciamento via sistema de cache com TTL configurável e renovação automática baseada em atividade.

*Validação*: Inputs validados via schemas estruturados, queries parametrizadas via camada de acesso a dados para prevenção de SQL injection.

*Criptografia*: Suporte a encryption at rest para campos marcados como `isEncrypted`.

=== Otimizações de Performance

*Banco de Dados*:
- 15+ índices estratégicos incluindo índices compostos para queries ABAC
- Connection pooling otimizado
- Prepared statements via camada de acesso a dados

*GraphQL*:
- DataLoader para batching e eliminação do problema N+1
- Query complexity analysis
- Caching de schemas
