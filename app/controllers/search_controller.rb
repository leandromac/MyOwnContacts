class SearchController < ApplicationController

    def contacts
        @contacts = Contact.search(params[:q])
    end

end
