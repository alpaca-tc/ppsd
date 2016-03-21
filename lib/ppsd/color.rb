class PPSD
  module Color
    # The red (R) color is calculated from the cyan (C) and black (K) colors:
    #   R = 255 * (1-C) * (1-K)
    # The green color (G) is calculated from the magenta (M) and black (K) colors:
    #   G = 255 * (1-M) * (1-K)
    # The blue color (B) is calculated from the yellow (Y) and black (K) colors:
    #   B = 255 * (1-Y) * (1-K)
    def self.cmyk_to_rgb(c, m, y, k)
      c = Rational(c, 100)
      m = Rational(m, 100)
      y = Rational(y, 100)
      k = Rational(k, 100)

      {
        r: ((1 - [1, c * (1 - k) + k].min) * 255).round,
        g: ((1 - [1, m * (1 - k) + k].min) * 255).round,
        b: ((1 - [1, y * (1 - k) + k].min) * 255).round
      }
    end
  end
end
