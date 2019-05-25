create table if not exists usuarios (
  nome VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  limite_de_credito FLOAT,
  PRIMARY KEY (nome)
);

create table if not exists transacoes (
  valor FLOAT,
  data TIMESTAMP,
  categoria VARCHAR(100),
  nome_usuario VARCHAR(255) NOT NULL,
  is_credito BOOLEAN,
 FOREIGN KEY (nome_usuario) REFERENCES usuarios(nome)
  ON DELETE CASCADE
);
