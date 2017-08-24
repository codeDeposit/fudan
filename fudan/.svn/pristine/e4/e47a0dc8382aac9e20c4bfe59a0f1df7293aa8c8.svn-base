$(function () {
    var defaultData = [
        {
            text: '食品百货',
            href: '#parent1',
            tags: ['4'],
            nodes: [
                {
                    text: '普通食品',
                    href: '#child1',
                    tags: ['2'],
                    nodes: [
                        {
                            text: '酒水',
                            href: '#grandchild1',
                            tags: ['0']
                  },
                        {
                            text: '饮料',
                            href: '#grandchild2',
                            tags: ['0']
                  }
                ]
              },
                {
                    text: '清洁产品',
                    href: '#child2',
                    tags: ['0']
              }
            ]
          },
        {
            text: '中药养生',
            href: '#parent2',
            tags: ['0']
        }
    ];
    $('#treeview11').treeview({
        color: "#428bca",
        data: defaultData,
        onNodeSelected: function (event, node) {
            $('#event_output').prepend('<p>您单击了 ' + node.text + '</p>');
        }
    });
    // $('#treeview11').on('nodeSelected', function (event, node) {
    //   $('#event_output').prepend('<p>您单击了 ' + node.text + '</p>');
    // });
});