require 'test_helper'

class ParkingTest < ActiveSupport::TestCase
  test "Não deve salvar 'Parking' sem placa" do
    parking = Parking.new
    parking.entry_at = DateTime.now
    assert_not parking.save, "Salvou 'Parking' sem placa"
  end

  test "Não deve salvar 'Parking' com a placa em formato inválido" do
    parking = Parking.new
    parking.plate = "AAAE-555"
    parking.entry_at = DateTime.now
    assert_not parking.save, "Salvou 'Parking' com a placa em formato inválido"
  end

  test "Deve salvar 'Parking' com a placa em formato válido" do
    parking = Parking.new
    parking.plate = "AAA-5555"
    parking.entry_at = DateTime.now
    assert parking.save, "Não salvou 'Parking' com a placa em formato válido"
  end

  test "Não deve salvar 'Parking' sem a data de entrada 'entry_at'" do
    parking = Parking.new
    parking.plate = "AAA-5555"
    assert_not parking.save, "Salvou 'Parking' sem a data de entrada 'entry_at'"
  end
end
