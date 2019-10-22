# README

### Project Description
O projeto surgiu em um encontro do Teresina Hacker Clube, chamado "Nerdices Randômicas, um hackaton pela vida" no mês de Setembro, no qual acontecem iniciativas e debates acerca da saúde mental com foco em prevenção ao suicídio. No app os usuários poderão externalizar suas emoções e contar sobre seu dia-a-dia, possibilitando compreender e organizar seus pensamentos. A intenção desta aplicação é facilitar para pacientes em terapia o exercício da atividade psicológica conhecida como "técnica das três colunas", que consiste em registrar emoções diárias e reflexão acerca delas.

### Dependencies

- ruby 2.6.3
- postgres (PostgreSQL) 11.5

### How to contribute

##### create fork
`git clone https://github.com/<your username>/carambolo`

`git remote add upstream https://github.com/teresinahc/carambolo`

##### submit a pull request

### Configuration
`bundle install`

`yarn install --check-files`

`pg_ctl -D /usr/local/var/postgres start`

`cp config/database.yml.sample config/database.yml`

### Database initialization
`rails db:setup`

### Run the server
`rails server`
