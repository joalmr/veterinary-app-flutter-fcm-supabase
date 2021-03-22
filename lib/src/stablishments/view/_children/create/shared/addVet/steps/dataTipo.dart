// var itemTipo = [
//   {'id': 1, 'name': 'Veterinaria'},
//   {'id': 2, 'name': 'Groomer'}
// ];

class ItemService {
  String id;
  String name;

  ItemService({
    this.id,
    this.name,
  });
}

List<ItemService> itemTipo = [
  ItemService(id: '1', name: 'Veterinaria'),
  ItemService(id: '2', name: 'Groomer'),
];
