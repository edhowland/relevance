module Relevance
  include Treetop::Runtime

  def root
    @root || :complex_expr
  end

  module ComplexExpr0
    def binary_operator
      elements[0]
    end

    def complex_expr
      elements[1]
    end

    def whitespace
      elements[2]
    end
  end

  module ComplexExpr1
    def complex_expr_with_parens
      elements[0]
    end

    def whitespace
      elements[1]
    end

  end

  module ComplexExpr2
    def binary_operator
      elements[0]
    end

    def complex_expr
      elements[1]
    end

    def whitespace
      elements[2]
    end
  end

  module ComplexExpr3
    def basic_expr
      elements[0]
    end

  end

  module ComplexExpr4
    def whitespace
      elements[0]
    end

    def whitespace
      elements[2]
    end
  end

  def _nt_complex_expr
    start_index = index
    if node_cache[:complex_expr].has_key?(index)
      cached = node_cache[:complex_expr][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_whitespace
    s0 << r1
    if r1
      i2 = index
      i3, s3 = index, []
      r4 = _nt_complex_expr_with_parens
      s3 << r4
      if r4
        r5 = _nt_whitespace
        s3 << r5
        if r5
          s6, i6 = [], index
          loop do
            i7, s7 = index, []
            r8 = _nt_binary_operator
            s7 << r8
            if r8
              r9 = _nt_complex_expr
              s7 << r9
              if r9
                r10 = _nt_whitespace
                s7 << r10
              end
            end
            if s7.last
              r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
              r7.extend(ComplexExpr0)
            else
              self.index = i7
              r7 = nil
            end
            if r7
              s6 << r7
            else
              break
            end
          end
          r6 = instantiate_node(SyntaxNode,input, i6...index, s6)
          s3 << r6
        end
      end
      if s3.last
        r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
        r3.extend(ComplexExpr1)
      else
        self.index = i3
        r3 = nil
      end
      if r3
        r2 = r3
      else
        i11, s11 = index, []
        r12 = _nt_basic_expr
        s11 << r12
        if r12
          s13, i13 = [], index
          loop do
            i14, s14 = index, []
            r15 = _nt_binary_operator
            s14 << r15
            if r15
              r16 = _nt_complex_expr
              s14 << r16
              if r16
                r17 = _nt_whitespace
                s14 << r17
              end
            end
            if s14.last
              r14 = instantiate_node(SyntaxNode,input, i14...index, s14)
              r14.extend(ComplexExpr2)
            else
              self.index = i14
              r14 = nil
            end
            if r14
              s13 << r14
            else
              break
            end
          end
          r13 = instantiate_node(SyntaxNode,input, i13...index, s13)
          s11 << r13
        end
        if s11.last
          r11 = instantiate_node(SyntaxNode,input, i11...index, s11)
          r11.extend(ComplexExpr3)
        else
          self.index = i11
          r11 = nil
        end
        if r11
          r2 = r11
        else
          self.index = i2
          r2 = nil
        end
      end
      s0 << r2
      if r2
        r18 = _nt_whitespace
        s0 << r18
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ComplexExpr4)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:complex_expr][start_index] = r0

    return r0
  end

  module ComplexExprWithParens0
    def complex_expr
      elements[1]
    end

  end

  def _nt_complex_expr_with_parens
    start_index = index
    if node_cache[:complex_expr_with_parens].has_key?(index)
      cached = node_cache[:complex_expr_with_parens][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('(', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_complex_expr
      s0 << r2
      if r2
        if input.index(')', index) == index
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r3 = nil
        end
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ComplexExprWithParens0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:complex_expr_with_parens][start_index] = r0

    return r0
  end

  module BasicExpr0
    def binary_operator
      elements[0]
    end

    def basic_expr
      elements[1]
    end
  end

  module BasicExpr1
    def item
      elements[0]
    end

  end

  def _nt_basic_expr
    start_index = index
    if node_cache[:basic_expr].has_key?(index)
      cached = node_cache[:basic_expr][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_basic_expr_with_parens
    if r1
      r0 = r1
    else
      i2, s2 = index, []
      r3 = _nt_item
      s2 << r3
      if r3
        s4, i4 = [], index
        loop do
          i5, s5 = index, []
          r6 = _nt_binary_operator
          s5 << r6
          if r6
            r7 = _nt_basic_expr
            s5 << r7
          end
          if s5.last
            r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            r5.extend(BasicExpr0)
          else
            self.index = i5
            r5 = nil
          end
          if r5
            s4 << r5
          else
            break
          end
        end
        r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
        s2 << r4
      end
      if s2.last
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
        r2.extend(BasicExpr1)
      else
        self.index = i2
        r2 = nil
      end
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:basic_expr][start_index] = r0

    return r0
  end

  module BasicExprWithParens0
    def basic_expr
      elements[1]
    end

  end

  def _nt_basic_expr_with_parens
    start_index = index
    if node_cache[:basic_expr_with_parens].has_key?(index)
      cached = node_cache[:basic_expr_with_parens][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('(', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_basic_expr
      s0 << r2
      if r2
        if input.index(')', index) == index
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r3 = nil
        end
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(BasicExprWithParens0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:basic_expr_with_parens][start_index] = r0

    return r0
  end

  module BinaryOperator0
    def whitespace
      elements[0]
    end

    def whitespace
      elements[2]
    end
  end

  def _nt_binary_operator
    start_index = index
    if node_cache[:binary_operator].has_key?(index)
      cached = node_cache[:binary_operator][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    r1 = _nt_whitespace
    s0 << r1
    if r1
      i2 = index
      if input.index('==', index) == index
        r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('==')
        r3 = nil
      end
      if r3
        r2 = r3
      else
        if input.index('!=', index) == index
          r4 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('!=')
          r4 = nil
        end
        if r4
          r2 = r4
        else
          if input.index('>=', index) == index
            r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('>=')
            r5 = nil
          end
          if r5
            r2 = r5
          else
            if input.index('<=', index) == index
              r6 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure('<=')
              r6 = nil
            end
            if r6
              r2 = r6
            else
              if input.index('>', index) == index
                r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure('>')
                r7 = nil
              end
              if r7
                r2 = r7
              else
                if input.index('<', index) == index
                  r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure('<')
                  r8 = nil
                end
                if r8
                  r2 = r8
                else
                  if input.index('&&', index) == index
                    r9 = instantiate_node(SyntaxNode,input, index...(index + 2))
                    @index += 2
                  else
                    terminal_parse_failure('&&')
                    r9 = nil
                  end
                  if r9
                    r2 = r9
                  else
                    if input.index('||', index) == index
                      r10 = instantiate_node(SyntaxNode,input, index...(index + 2))
                      @index += 2
                    else
                      terminal_parse_failure('||')
                      r10 = nil
                    end
                    if r10
                      r2 = r10
                    else
                      self.index = i2
                      r2 = nil
                    end
                  end
                end
              end
            end
          end
        end
      end
      s0 << r2
      if r2
        r11 = _nt_whitespace
        s0 << r11
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(BinaryOperator0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:binary_operator][start_index] = r0

    return r0
  end

  module Item0
    def whitespace
      elements[0]
    end

    def identifier
      elements[1]
    end
  end

  def _nt_item
    start_index = index
    if node_cache[:item].has_key?(index)
      cached = node_cache[:item][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_whitespace
    s1 << r2
    if r2
      r3 = _nt_identifier
      s1 << r3
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Item0)
    else
      self.index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r4 = _nt_number
      if r4
        r0 = r4
      else
        r5 = _nt_string
        if r5
          r0 = r5
        else
          self.index = i0
          r0 = nil
        end
      end
    end

    node_cache[:item][start_index] = r0

    return r0
  end

  module Identifier0
  end

  module Identifier1
		  def value
			  "field('#{text_value}')"
			end
  end

  def _nt_identifier
    start_index = index
    if node_cache[:identifier].has_key?(index)
      cached = node_cache[:identifier][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[a-zA-Z]'), index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[a-zA-Z0-9_\\[\\]]'), index) == index
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Identifier0)
      r0.extend(Identifier1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:identifier][start_index] = r0

    return r0
  end

  def _nt_string
    start_index = index
    if node_cache[:string].has_key?(index)
      cached = node_cache[:string][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0 = index
    r1 = _nt_double_quoted_string
    if r1
      r0 = r1
    else
      r2 = _nt_single_quoted_string
      if r2
        r0 = r2
      else
        self.index = i0
        r0 = nil
      end
    end

    node_cache[:string][start_index] = r0

    return r0
  end

  module SingleQuotedString0
  end

  module SingleQuotedString1
  end

  def _nt_single_quoted_string
    start_index = index
    if node_cache[:single_quoted_string].has_key?(index)
      cached = node_cache[:single_quoted_string][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index("'", index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure("'")
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3, s3 = index, []
        i4 = index
        if input.index("'", index) == index
          r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("'")
          r5 = nil
        end
        if r5
          r4 = nil
        else
          self.index = i4
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s3 << r4
        if r4
          if index < input_length
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r6 = nil
          end
          s3 << r6
        end
        if s3.last
          r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
          r3.extend(SingleQuotedString0)
        else
          self.index = i3
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        if input.index("'", index) == index
          r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("'")
          r7 = nil
        end
        s0 << r7
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(SingleQuotedString1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:single_quoted_string][start_index] = r0

    return r0
  end

  module DoubleQuotedString0
  end

  module DoubleQuotedString1
  end

  def _nt_double_quoted_string
    start_index = index
    if node_cache[:double_quoted_string].has_key?(index)
      cached = node_cache[:double_quoted_string][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index('"', index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('"')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        i3 = index
        i4, s4 = index, []
        i5 = index
        if input.index('"', index) == index
          r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('"')
          r6 = nil
        end
        if r6
          r5 = nil
        else
          self.index = i5
          r5 = instantiate_node(SyntaxNode,input, index...index)
        end
        s4 << r5
        if r5
          if index < input_length
            r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("any character")
            r7 = nil
          end
          s4 << r7
        end
        if s4.last
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          r4.extend(DoubleQuotedString0)
        else
          self.index = i4
          r4 = nil
        end
        if r4
          r3 = r4
        else
          if input.index('\"', index) == index
            r8 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('\"')
            r8 = nil
          end
          if r8
            r3 = r8
          else
            self.index = i3
            r3 = nil
          end
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
      if r2
        if input.index('"', index) == index
          r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('"')
          r9 = nil
        end
        s0 << r9
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(DoubleQuotedString1)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:double_quoted_string][start_index] = r0

    return r0
  end

  module Number0
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      @index = cached.interval.end if cached
      return cached
    end

    i0, s0 = index, []
    if input.index(Regexp.new('[1-9]'), index) == index
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if input.index(Regexp.new('[0-9]'), index) == index
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      s0 << r2
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Number0)
    else
      self.index = i0
      r0 = nil
    end

    node_cache[:number][start_index] = r0

    return r0
  end

  def _nt_whitespace
    start_index = index
    if node_cache[:whitespace].has_key?(index)
      cached = node_cache[:whitespace][index]
      @index = cached.interval.end if cached
      return cached
    end

    s0, i0 = [], index
    loop do
      if input.index(Regexp.new('[\\s]'), index) == index
        r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:whitespace][start_index] = r0

    return r0
  end

end

class RelevanceParser < Treetop::Runtime::CompiledParser
  include Relevance
end


