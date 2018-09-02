module ApplicationHelper
    def document_title
      if @document_title.present?
        h(@document_title) + ' | イチオシ交換ガチャ'
      else
        'イチオシ交換ガチャ'
      end
    end

end