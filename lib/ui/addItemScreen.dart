
import 'package:boutique_merchant/models/category.dart';
import 'package:boutique_merchant/provider/addItemProvider.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/provider/authVM.dart';
import 'package:boutique_merchant/ui/authScreen/loginScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/utils/validations.dart';
import 'package:boutique_merchant/widgets/PrimaryButton.dart';
import 'package:boutique_merchant/widgets/toolbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _popupCustomValidationKey = GlobalKey<DropdownSearchState<int>>();


  @override
  void initState() {
    super.initState();

    Provider.of<AddItemProvider>(context, listen: false).getAddItemsFilter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolBar("Add Item"),
      body: Consumer<AddItemProvider>(builder: (context, provider, child) {
        if(provider.isAddItemFilterLoading)
          return Center(child: CircularProgressIndicator(),);
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
                    decoration: Styles.inputForm(),
                    validator: Validations.required,
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Category",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<String>(
                    popupProps: PopupProps.dialog(
                      showSelectedItems: true,
                    ),
                    items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select category"),
                    onChanged: (value) {
                      provider.category = value;
                    },
                    autoValidateMode: provider.autoValidateMode,
                    selectedItem: "Brazil",
                    validator: (String? item) {
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
                  DropdownSearch<Category>(
                    popupProps: PopupProps.dialog(
                      //showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    items: provider.addItemsFilterResponse!.data!.materialType!,
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select material type"),
                    onChanged: (value) {
                      provider.materialType = value;
                    },
                    autoValidateMode: provider.autoValidateMode,
                    validator: (Category? item) {
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
                  TextFormField(
                    controller: provider.nameController,
                    keyboardType: TextInputType.name,
                    decoration: Styles.inputForm(),
                  ),
                  Styles.spaceHeight20,
                  Text(
                    "Item Status",
                    style: Styles.textStyle.smallBoldTS,
                  ),
                  Styles.spaceHeight12,
                  DropdownSearch<Category>(
                    popupProps: PopupProps.dialog(
                      //showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    items: provider.addItemsFilterResponse!.data!.itemStatus!,
                    dropdownDecoratorProps:
                        Styles.dropDownDecoration("Select item status"),
                    onChanged: (value) {
                      provider.itemStatus = value;
                    },
                    autoValidateMode: provider.autoValidateMode,
                    validator: (Category? item) {
                      if (item == null)
                        return "Required field";
                      else
                        return null;
                    },
                  ),
                  Styles.spaceHeight50,
                  PrimaryButton(
                    "Add Item",
                    onTap: () {
                      provider.addItem();
                    },
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
