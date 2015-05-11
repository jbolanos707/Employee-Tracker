require('spec_helper')

describe(Division) do

  describe('#employees') do
    it("assigns an employee to a particular division") do
      test_division = Division.create({:department => "HR"})
      test_employee1 = test_division.employees.create({:name => "Bob"})
      test_employee2 = test_division.employees.create({:name => "Jane"})
      division_employee = [test_employee1, test_employee2]
      expect(test_division.employees).to(eq(division_employee))
    end
  end
end
