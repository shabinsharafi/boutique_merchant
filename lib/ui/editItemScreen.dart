import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/models/itemColor.dart';
import 'package:boutique_merchant/models/items.dart';
import 'package:boutique_merchant/models/masterOption.dart';
import 'package:boutique_merchant/provider/addItemProvider.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/provider/authVM.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/utils/validations.dart';
import 'package:boutique_merchant/widgets/AnimatedButtonLoader.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen(this.item, {Key? key}) : super(key: key);
  Item item;

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();

  @override
  void initState() {
    super.initState();
    var provider=Provider.of<AddItemProvider>(context, listen: false);
    provider.getAddItemsFilter(isEdit: true,item:widget.item);
    provider.nameController.text = widget.item.name!;
    provider.descriptionController.text = widget.item.description!;
    provider.mrpController.text = widget.item.mrp.toString();
    provider.priceController.text = widget.item.price.toString();
    provider.deliveryDaysController.text = widget.item.deliveryDays.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolBar("Update Item"),
      body: Consumer<AddItemProvider>(builder: (context, provider, child) {
        if (provider.isAddItemFilterLoading)
          return Center(
            child: CircularProgressIndicator(),
          );
        return Padding(
          padding: Styles.normalScreenPadding,
          child: Form(
            key: provider.addItemFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.spaceHeight30,
                  Text(
                    "Name",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: provider.nameController,
                    autovalidateMode: provider.autoValidateMode,
                    keyboardType: TextInputType.name,
                    decoration: Styles.inputForm(),
                    validator: Validations.required,
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Description",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: provider.descriptionController,
                    keyboardType: TextInputType.name,
                    autovalidateMode: provider.autoValidateMode,
                    maxLines: 7,
                    minLines: 4,
                    decoration: Styles.inputForm(),
                    validator: Validations.required,
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Category",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<Category>(
                    popupProps: PopupProps.dialog(
                      // showSelectedItems: true,
                    ),
                    selectedItem: provider.category,
                    items: provider.addItemsFilterResponse!.data!.category!,
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select category"),
                    onChanged: (value) {
                      provider.category = value;
                    },
                    itemAsString: (item) => item.name!,
                    autoValidateMode: provider.autoValidateMode,
                    //selectedItem: "Brazil",
                    validator: (Category? item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Material Type",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<MasterOption>(
                    popupProps: PopupProps.dialog(
                      //showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    selectedItem: provider.materialType,
                    items: provider.addItemsFilterResponse!.data!.materialType!,
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select material type"),
                    onChanged: (value) {
                      provider.materialType = value;
                    },
                    itemAsString: (item) => item.name!,
                    autoValidateMode: provider.autoValidateMode,
                    validator: (MasterOption? item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Occasion",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<Category>.multiSelection(
                    popupProps: PopupPropsMultiSelection.dialog(
                      //showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    selectedItems: provider.occasions,
                    items: provider.addItemsFilterResponse!.data!.occasion!,
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select occasion"),
                    onChanged: (value) {
                      provider.occasions=(value);
                    },
                    itemAsString: (item) => item.name!,
                    autoValidateMode: provider.autoValidateMode,
                    validator: (List<Category>? item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Colors",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<ItemColor>.multiSelection(
                    popupProps: PopupPropsMultiSelection.dialog(
                      //showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    selectedItems: provider.colors,
                    items: provider.addItemsFilterResponse!.data!.color!,
                    dropdownDecoratorProps:
                    Styles.dropDownDecoration("Select item colors"),
                    onChanged: (value) {
                      provider.colors=value;
                    },
                    itemAsString: (item) => item.name!,
                    autoValidateMode: provider.autoValidateMode,
                    validator: (List<ItemColor>? item) {
                      if (item == null||item.isEmpty)
                        return "Required field";
                      else
                        return null;
                    },
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Expected preparation/delivery days",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: provider.deliveryDaysController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.inputForm(),
                    validator: Validations.required,
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "MRP",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: provider.mrpController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.inputForm(),
                    validator: Validations.required,
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Selling Price",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  TextFormField(
                    controller: provider.priceController,
                    keyboardType: TextInputType.number,
                    decoration: Styles.inputForm(),
                    validator: Validations.required,
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Item Status",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<MasterOption>(
                    popupProps: PopupProps.dialog(
                      //showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    selectedItem: provider.itemStatus,
                    items: provider.addItemsFilterResponse!.data!.itemStatus!,
                    itemAsString: (item) => item.name!,
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select item status"),
                    onChanged: (value) {
                      provider.itemStatus = value;
                    },
                    autoValidateMode: provider.autoValidateMode,
                    validator: (MasterOption? item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                  ),
                  Styles.spaceHeight50,
                  AnimatedButtonLoader(
                    loading: provider.isAddItemLoading,
                    child: PrimaryButton(
                      "Update Item",
                      onTap: () {
                        provider.updateItem(widget.item.id);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
