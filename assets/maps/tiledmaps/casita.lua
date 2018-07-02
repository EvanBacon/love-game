return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "2017.12.07",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 12,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 3,
  properties = {},
  tilesets = {
    {
      name = "tileset-pokemon_dawn",
      firstgid = 1,
      filename = "../tilesets/tileset-pokemon_dawn.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../tilesets/img/tileset-pokemon_dawn.png",
      imagewidth = 1504,
      imageheight = 2519,
      transparentcolor = "#000000",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 14758,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "suelo",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 4210, 4210, 4210, 4210, 4210, 4210, 4210, 4210, 4210, 4210, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 4480, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "colisiones 1 objetos",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        570, 570, 570, 570, 570, 570, 570, 570, 570, 570, 570, 570,
        570, 4203, 4204, 4204, 4204, 4204, 4204, 4204, 4204, 4204, 4205, 570,
        570, 4297, 4298, 4298, 4298, 4298, 4298, 4298, 4298, 4298, 4299, 570,
        570, 4391, 4392, 4392, 4392, 4392, 4392, 4392, 4392, 4392, 4393, 570,
        570, 6283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 570,
        570, 6377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 570,
        570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 570,
        570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 570,
        570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 570,
        570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 570,
        570, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7046, 570,
        570, 570, 570, 570, 570, 570, 570, 570, 570, 570, 570, 570
      }
    },
    {
      type = "tilelayer",
      name = "objetos sin colision",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 4681, 4682, 0, 0, 0, 0, 4406, 4407, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5252, 5253, 5253, 5253, 5254, 0, 0, 0, 0,
        0, 0, 0, 5346, 5347, 5347, 5347, 5348, 0, 0, 0, 0,
        0, 0, 0, 5346, 5347, 5347, 5347, 5348, 0, 0, 0, 0,
        0, 0, 0, 5440, 5441, 5441, 5441, 5442, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 4686, 4687, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "objetos que colisionan",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2134, 2135, 0, 4873, 4874, 0, 5822, 5823, 0, 0,
        0, 0, 2228, 2229, 0, 4967, 4968, 0, 5916, 5917, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 4881, 4882, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 4975, 4976, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "sin colision",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 1937, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 5449, 0, 0, 5449, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5069, 5070, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "parte de arriba del pc",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      name = "Capa de Objetos 1",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 1,
          name = "player",
          type = "",
          shape = "rectangle",
          x = 90.6667,
          y = 160,
          width = 16,
          height = 11,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      name = "warp",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 2,
          name = "warp",
          type = "",
          shape = "rectangle",
          x = 88,
          y = 160,
          width = 23.6667,
          height = 11.3333,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
