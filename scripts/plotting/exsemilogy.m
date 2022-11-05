  function[varargout] = exsemilogy(varargin)
% function[varargout] = exsemilogy(varargin)
% Implements the matlab semilogy function, but does some
% modification of the plot so that it's readable upon
% export. This routine was written by Akil Narayan.
hand = semilogy(varargin{:});
for q = 1:length(hand);
  set(hand,'LineWidth',5);
  set(hand,'MarkerSize',12);
end
set(gca, 'FontSize', 16, 'FontWeight', 'n');
if nargout>=1;
  varargout{1} = hand;
end
