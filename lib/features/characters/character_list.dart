import 'package:calibrar/components/character_container.dart';
import 'package:calibrar/components/main_bar.dart';
import 'package:calibrar/components/pagination_btn.dart';
import 'package:calibrar/features/characters/characters_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CharacterList extends HookConsumerWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController controller = ScrollController();

    final ValueNotifier<int> page = useState(1);
    final ValueNotifier<bool> isLoading = useState(false);

    final state = ref.watch(charactersNotifierProvider);
    final notifier = ref.watch(charactersNotifierProvider.notifier);

    useEffect(() {
      notifier.getAllCharacter(page.value);
      return null;
    }, []);

    void scrollToTop() {
      controller.animateTo(-20,
          duration: const Duration(milliseconds: 2), curve: Curves.linear);
    }

    final next = state.info.next;
    final prev = state.info.prev;
    final Breakpoint breakpoint = ResponsiveBreakpoints.of(context).breakpoint;

    void onPaginate(int? pageNum) async {
      if (pageNum != null) {
        isLoading.value = true;
        await notifier.getAllCharacter(pageNum).then(
          (res) {
            scrollToTop();
            page.value = res;
            isLoading.value = false;
          },
        );
      }
    }

    return Scaffold(
      appBar: const MainBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: state.results.isEmpty || isLoading.value
            ? Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  color: const Color.fromARGB(255, 207, 69, 69),
                  size: 50,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: breakpoint.name == "DESKTOP" ? 5 : 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      controller: controller,
                      itemCount: state.results.length,
                      itemBuilder: (ctx, i) => CharacterContainer(
                        character: state.results[i],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => onPaginate(1),
                          icon: const Icon(
                            Icons.keyboard_double_arrow_left,
                            size: 30,
                            color: Color.fromRGBO(120, 171, 168, 1),
                          ),
                        ),
                        PaginationBtn(
                          page: prev,
                          onPressed: () => onPaginate(prev),
                        ),
                        PaginationBtn(
                          isCurrentPage: true,
                          page: page.value,
                        ),
                        PaginationBtn(
                          page: next,
                          onPressed: () => onPaginate(next),
                        ),
                        IconButton(
                          onPressed: () => onPaginate(state.info.pages),
                          icon: const Icon(
                            Icons.keyboard_double_arrow_right,
                            size: 30,
                            color: Color.fromRGBO(120, 171, 168, 1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
