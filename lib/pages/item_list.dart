import 'package:checkprovider/model/item_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ItemData>(builder: (context, data, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.size,
          itemBuilder: (context, index) {
            final item = data.items[index];
            return GestureDetector(
              onLongPress: () => data.removeItem(item),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text(item.item[0]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.item,
                        style: TextStyle(
                            decoration: item.completed
                                ? TextDecoration.lineThrough
                                : null,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                        value: item.completed,
                        onChanged: (c) => data.toggleItem(item),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
