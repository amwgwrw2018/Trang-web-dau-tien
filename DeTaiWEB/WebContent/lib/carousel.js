

      $(function() {

        $('#carousel').carouFredSel({
          width: '100%',
          items: {
            visible: 'odd+2'
          },
          scroll: {
            pauseOnHover: true,
            onBefore: function() {
              $(this).children().removeClass( 'hover' );
            }
          },
          auto: {
            items: 1,
            easing: 'linear',
            duration: 5250,
            timeoutDuration: 0
          },
          pagination: {
            container: '#pager',
            items: 1,
            duration: 0.5,
            queue: 'last',
            onAfter: function() {
              var cur = $(this).triggerHandler( 'currentVisible' ),
                mid = Math.floor( cur.length / 2 );

              cur.eq( mid ).addClass( 'hover' );
            }
          }
        });

      });
