class RequestviaCep
    include HTTParty

    base_uri API["viaCepApi"]["endpoint"]

    def request_zip_code(cep)
        return self.class.get(
            "/#{cep}/json/"
        )
    end
end