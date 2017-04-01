require 'test_helper'

class H2E::MainTest < Minitest::Test

  def setup
    @obj = ::H2E::Converter.new()
  end

  def test_form_1
    assert_equal create_expected_enml_body('<div></div>'), @obj.from('<div id="hoge"></div>')
  end

  def test_form_2
    assert_equal create_expected_enml_body('<a href="/hoge"></a>'), @obj.from('<a href="/hoge"></a>')
  end

  def test_form_2_1
    @obj.html_base_url = "https://example.com"
    assert_equal create_expected_enml_body('<a href="https://example.com/hoge"></a>'), @obj.from('<a href="/hoge"></a>')
    @obj.html_base_url = nil
  end

  def test_form_3
    assert_equal create_expected_enml_body('<a href="%EF%BC%88"></a>'), @obj.from('<a href="%EF%BC%88"></a>')
  end

  def test_form_3_1
    @obj.html_base_url = "https://example.com"
    assert_equal create_expected_enml_body('<a href="https://example.com/%EF%BC%88"></a>'), @obj.from('<a href="%EF%BC%88"></a>')
    @obj.html_base_url = nil
  end

  def test_form_4
    assert_equal create_expected_enml_body("<div style=\"#{H2E::P_CODE_BLOCK_STYLE .map{|k,v| "#{k}: #{v}"}.join(";")}\"><code style=\"#{H2E::CODE_BLOCK_STYLE .map{|k,v| "#{k}: #{v}"}.join(";")}\">code</code></div>"), @obj.from('<div><pre>code</pre></div>')
  end


  private

  def create_expected_enml_body(body)
    content = "#{H2E::ENML_HEADER}"
    content << "<en-note>"
    content << body
    content << "</en-note>"
  end

end
