# LoanChecker
class LoanChecker
  def can_lend_to?(client)
    !client.has_debt?
  rescue
    nil
  end
end
