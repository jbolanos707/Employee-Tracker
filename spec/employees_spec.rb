require 'spec_helper'

describe(Employee) do
  describe('#division') do
    it('tells division employee is in') do
      test_division = Division.create({department: "HR"})
      test_employee = Employee.create({name: "Bob", division_id: test_division.id})
      test_employee2 = Employee.create({name: "Jennifer", division_id: 1})
      expect(test_employee.division).to(eq(test_division))
    end
  end
end
