var ONE_FRAME_TIME = 1/30; // Aproximadamente 30 frames por segundo
var UP = 38, RIGHT = 39, DOWN = 40, LEFT = 37;

$(document).ready(function() {
  Game.init(50, 50, $(".canvas"));
  setInterval( mainLoop, ONE_FRAME_TIME*1000);
  $(document).keydown(Game.keypress);
  resize();
});

function resize() {
  var canvas = Game.canvas;
  var width = canvas.innerWidth();
  var height = canvas.innerHeight();
  console.log(width+" "+height);
  var pixel_width  = Math.floor(width/Game.mapa.colunas);
  var pixel_height = Math.floor(height/Game.mapa.linhas);
  console.log(pixel_width+" "+pixel_height); 

  $(".pixel").css("width", pixel_width+"px").css("height", pixel_height+"px");
}


function mainLoop() {
  if( Game.running === true ) {
    Game.update(ONE_FRAME_TIME);
    Game.draw();
  }
}

function update(dt) {
  //console.log("Fucaoo sendo atualizada a cada: "+dt);
  Game.player.update(dt);
}

function draw() {
  Game.clearCanvas();
  
  Game.draw_comidas();
  Game.player.draw(Game.mapa);
}

function init(linhas, colunas, canvas) {
  Game.canvas = canvas;
  Game.canvas.html("");
  Game.mapa   = new Mapa(linhas, colunas, canvas);
  Game.setPlayer(new Snake(Game.mapa.inicio()));
  Game.adicionaComida();
}

function Mapa(linhas, colunas, canvas) {  
  this.linhas = linhas;
  this.colunas = colunas;

  this.mapa = [];
  for(var i = 0; i < linhas; ++i) {
    this.mapa.push([]);
    for(var j = 0; j < colunas; ++j) {
      var id = i+"_"+j;
      canvas.append("<div class=\"pixel\" id=\""+id+"\"></div>");
      this.mapa[i].push($("#"+id));
    }
  }


  this.inicio = function() {
    return [1,0];
  };

  //Retorna uma posicao random dentro dos limites do mapa.
  this.randomPosition = function() {
    return Vetor.novo(Math.floor(Math.random()*this.linhas), Math.floor(Math.random()*this.colunas));
  };

  this.draw = function() {

  }
}

function setPlayer(snake) {
  snake.update = function(dt) {
    this.posicao_acumulada += this.velocidade*dt;
    //console.log(this.posicao_acumulada);

    if(this.posicao_acumulada >= 1) {
      this.move(Math.floor(this.posicao_acumulada));
      this.posicao_acumulada -= Math.floor(this.posicao_acumulada);
    }
  };
  this.player = snake;
}

var Game = {
  estado: "inicio",
  mainLoop: mainLoop,
  running: true,
  update: update,
  draw: draw,
  init: init,
  player: null,
  setPlayer: setPlayer,
  mapa: null,
  comidas: [],
  LIMITE_COMIDA: 3,
  canvas: null,
  //Atualiza a novaCelula baseado nos limites do mapa
  verificaLimites: function(celula) {
    while(celula[0] < 0){
      celula[0] += this.mapa.colunas;
    }
    while(celula[1] < 0) {
      celula[1] += this.mapa.linhas;
    }
    celula[0] = celula[0]%this.mapa.colunas;
    celula[1] = celula[1]%this.mapa.linhas;
  },
  //Retorna o id da comida que colide com a celula; se não houver, retorna null
  colisaoComida: function(celula) {
    for(var i = 0; i < this.comidas.length; ++i) {
      if(Vetor.compara(this.comidas[i], celula) === Vetor.IGUAL) {
        return i;
      }
    }
    return null;
  },
  //Adiciona uma comida no mapa se nao ultrapassar o limite
  adicionaComida: function() {
    if(this.LIMITE_COMIDA > this.comidas.length) {
      //PROBLEMA: metodo nao eficiente
      var novaComida;
      var colisao = true;
      while(colisao === true) {
        novaComida = this.mapa.randomPosition();
        if(this.colisaoComida(novaComida) !== null) {
          continue;
        }
        if(this.player.colisao(novaComida) === true) {
          continue;
        }
        colisao = false;
      }
      console.log(novaComida);
      this.comidas.push(novaComida);
    }
    //TODO adicionar para a lista de mudancas
  },
  //Resolve a colisao Player e Comida
  resolveColisaoPlayerComida: function(idComida) {
    //Remove a comida do vetor de comidas
    console.log("Comecando a remocao da comida!");
    this.removeComida(idComida);

    this.adicionaComida();
    //TODO Aumenta a pontuacao do player

    //TODO Verifica se o player ganhou o jogo
  },
  removeComida: function(idComida) {
    if(this.comidas.length === 1 || idComida === this.comidas.length) {
      this.comidas.pop();
      return;
    }
    
    this.comidas[idComida] = this.comidas.pop();
  },
  gameOver: function() {
    //TODO parar o jogo
    //TODO mostrar mensagem de gameOver
    //TODO ir para o estado inicial
    console.log("Gameover!");
  },
  keypress: function() {
    var key = event.which || event.keyCode;
    console.log(key);
    //TODO lidar com os estados do game
    Game.player.mudarSentido(key);
  },
  clearCanvas: function() {
    $(".pixel").removeClass("cobra comida");
  },
  draw_comidas: function() {
    for(var i = 0; i < Game.comidas.length; ++i) {
      Game.mapa.mapa[Game.comidas[i][1]][Game.comidas[i][0]].addClass("comida");
    }
  }
};

function Snake(posicao) {
  this.posicao_head = posicao;
  this.corpo = new Corpo(this.posicao_head);
  this.velocidade = 30; // Uma celula por segundo
  this.sentido = LEFT;
  this.posicao_acumulada = 0;

  this.move = function(nCelulas) {
    // Adiciona as nCelulas, verificando a colisao a cada passo 
    for(var i = 0; i < nCelulas; ++i) {
      var novaCelula = Vetor.deslocamento(this.posicao_head, this.sentido); //Nova celula a ser adicionada
      Game.verificaLimites(novaCelula);
      
      //Lida com colisao com a comida
      var comida = Game.colisaoComida(novaCelula);
      if(comida !== null) {
        console.log("Houve uma colisao com a comida!");
        Game.resolveColisaoPlayerComida(comida);
      }
      else {
        //Se nao houve colisao com a comida, a ultima celula do corpo e' mantida
        this.corpo.removeUltimo();
      }
      
      // Verifica a colisao com o proprio corpo
      if(this.corpo.colisao(novaCelula)) {
        //Se houve colisao, 
        Game.gameOver();
      }

      this.corpo.adiciona(novaCelula);
      this.posicao_head = novaCelula;
    }    
  };
  //Retorna se tem colisao com a celula e a snake
  this.colisao = function(celula) {
    if(this.corpo.colisao(celula) === true) {
      return true;
    }
    return false;
  };

  this.mudarSentido = function(sentido) {
    if(!(sentido === UP || sentido === DOWN || sentido === LEFT || sentido === RIGHT)) {
      return;
    }
    if(sentido !== sentidoContrario(this.sentido)) {
      console.log("Mudanca de sentido!");
      this.sentido = sentido;
    }
  };

  this.draw = function(mapa) {
    for(var i = 0; i < this.corpo.celulas.length; ++i) {
      mapa.mapa[this.corpo.celulas[i][1]][this.corpo.celulas[i][0]].addClass("cobra");
    }
  }
}

function sentidoContrario(sentido) {
  switch(sentido) {
    case UP:
      return DOWN;
    case LEFT:
      return RIGHT;
    case RIGHT:
      return LEFT;
    case DOWN:
      return UP;
  }
}

function Corpo(posicao) {
  this.celulas = [posicao];

  this.colisao = function(celula) {
    for(var i = 0; i < this.celulas.length; ++i) {
      if(Vetor.compara(celula, this.celulas[i]) === Vetor.IGUAL) {
        return true;
      }
    }
    return false;
  };

  //Corpo remove ultima celula e adiciona na lista de mudancas
  this.removeUltimo = function() {
    var celRemovida = this.celulas.pop();

    //TODO adicionar para a lista de mudancas
  }

  //Adiciona no comeco do corpo uma nova celula na pos e adiciona na lista de mudancas
  this.adiciona = function(pos) {
    this.celulas.unshift(pos);

    //TODO adicionar para a lista de mudancas
  }
}

var Vetor = {
  soma: function(v1, v2) {return [v1[0]+v2[0], v1[1]+v2[1]]; },
  novo: function(x, y) {return [x,y];},
  deslocamento: function(posicao, sentido) {
    switch(sentido) {
      case RIGHT:
        return [posicao[0]+1, posicao[1]];
      case LEFT:
        return [posicao[0]-1, posicao[1]];
      case UP:
        return [posicao[0], posicao[1]-1];
      case DOWN:
        return [posicao[0], posicao[1]+1];
      default:
        return [posicao[0], posicao[1]];
    }
  },
  IGUAL: 0,
  DIFERENTE: -2,
  // Retorna IGUAL se os vetores forem iguais,
  compara: function(v1, v2) {
    if(v1[0] === v2[0] && v1[1] === v2[1]) {
      return this.IGUAL;
    }
    return this.DIFERENTE;
  }
};