class ItemService {
  String? id;
  String? name;

  ItemService({
    this.id,
    this.name,
  });
}

List<ItemService> itemTipo = [
  ItemService(id: '1', name: 'Veterinaria'),
  ItemService(id: '2', name: 'Groomer'),
];

List<ItemService> personalTipo = [
  ItemService(id: '1', name: 'Groomer'),
  ItemService(id: '2', name: 'Veterinaria/o'),
];
