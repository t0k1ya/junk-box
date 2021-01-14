module Admin::AdminsHelper
  def show_status(status)
    if status == '0'
      return '下書き'
    elsif status == '1'
      return '公開済み'
    end
  end
end
